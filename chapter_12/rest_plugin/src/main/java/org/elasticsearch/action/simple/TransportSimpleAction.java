/*
 * Licensed to ElasticSearch and Shay Banon under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. ElasticSearch licenses this
 * file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.elasticsearch.action.simple;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReferenceArray;

import org.elasticsearch.action.ShardOperationFailedException;
import org.elasticsearch.action.support.ActionFilters;
import org.elasticsearch.action.support.DefaultShardOperationFailedException;
import org.elasticsearch.action.support.broadcast.BroadcastShardOperationFailedException;
import org.elasticsearch.action.support.broadcast.TransportBroadcastOperationAction;
import org.elasticsearch.cluster.ClusterService;
import org.elasticsearch.cluster.ClusterState;
import org.elasticsearch.cluster.block.ClusterBlockException;
import org.elasticsearch.cluster.block.ClusterBlockLevel;
import org.elasticsearch.cluster.routing.GroupShardsIterator;
import org.elasticsearch.cluster.routing.ShardRouting;

import static org.elasticsearch.common.collect.Lists.newArrayList;

import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.index.shard.service.InternalIndexShard;
import org.elasticsearch.indices.IndicesService;
import org.elasticsearch.threadpool.ThreadPool;
import org.elasticsearch.transport.TransportService;

/**
 * Simple index/indices action.
 */
public class TransportSimpleAction
        extends TransportBroadcastOperationAction<SimpleRequest, SimpleResponse, ShardSimpleRequest, ShardSimpleResponse> {

    private final IndicesService indicesService;
    private final Object simpleMutex = new Object();

    @Inject
    public TransportSimpleAction(Settings settings, ThreadPool threadPool, ClusterService clusterService,
                                 TransportService transportService, IndicesService indicesService, ActionFilters actionFilters) {
        super(settings, SimpleAction.NAME, threadPool, clusterService, transportService, actionFilters);
        this.indicesService = indicesService;
    }


    @Override
    protected String executor() {
        return ThreadPool.Names.MERGE;
    }

    @Override
    protected SimpleRequest newRequest() {
        return new SimpleRequest();
    }

    @Override
    protected SimpleResponse newResponse(SimpleRequest request, AtomicReferenceArray shardsResponses, ClusterState clusterState) {
        int successfulShards = 0;
        int failedShards = 0;
        List<ShardOperationFailedException> shardFailures = null;
        Set<String> simple = new HashSet<String>();
        for (int i = 0; i < shardsResponses.length(); i++) {
            Object shardResponse = shardsResponses.get(i);
            if (shardResponse == null) {
                // a non active shard, ignore...
            } else if (shardResponse instanceof BroadcastShardOperationFailedException) {
                failedShards++;
                if (shardFailures == null) {
                    shardFailures = newArrayList();
                }
                shardFailures.add(new DefaultShardOperationFailedException((BroadcastShardOperationFailedException) shardResponse));
            } else {
                successfulShards++;
                if (shardResponse instanceof ShardSimpleResponse) {
                    ShardSimpleResponse resp = (ShardSimpleResponse) shardResponse;
                    simple.addAll(resp.getTermList());
                }
            }
        }
        return new SimpleResponse(shardsResponses.length(), successfulShards, failedShards, shardFailures, simple);
    }

    @Override
    protected ShardSimpleRequest newShardRequest() {
        return new ShardSimpleRequest();
    }


    @Override
    protected ShardSimpleRequest newShardRequest(int numShards, ShardRouting shard, SimpleRequest request) {
        return new ShardSimpleRequest(shard.shardId(), request);
    }


    @Override
    protected ShardSimpleResponse newShardResponse() {
        return new ShardSimpleResponse();
    }

    @Override
    protected ShardSimpleResponse shardOperation(ShardSimpleRequest request) {
        synchronized (simpleMutex) {
            InternalIndexShard indexShard = (InternalIndexShard) indicesService.indexServiceSafe(request.index()).shardSafe(request.shardId().id());
            indexShard.store().directory();
            Set<String> set = new HashSet<String>();
            set.add(request.getField() + "_" + request.shardId());
            return new ShardSimpleResponse(request.shardId(), set);
        }
    }

    /**
     * The simple request works against primary shards.
     */
    @Override
    protected GroupShardsIterator shards(ClusterState clusterState, SimpleRequest request, String[] concreteIndices) {
        return clusterState.routingTable().activePrimaryShardsGrouped(concreteIndices, true);
    }

    @Override
    protected ClusterBlockException checkGlobalBlock(ClusterState state, SimpleRequest request) {
        return state.blocks().globalBlockedException(ClusterBlockLevel.METADATA);
    }

    @Override
    protected ClusterBlockException checkRequestBlock(ClusterState state, SimpleRequest request, String[] concreteIndices) {
        return state.blocks().indicesBlockedException(ClusterBlockLevel.METADATA, concreteIndices);
    }
}