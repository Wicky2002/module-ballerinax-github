// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// Proof-of-concept for generated webhook-trigger dispatch tests. Covers a representative
// sample of event categories (bare event, composite fixed-action event, free-form-action
// event) rather than all 265 actions -- see the equivalent full-coverage harness at
// asyncapi-tools/testing-artifacts/github/ for the complete set this will eventually be
// generated from.

import ballerina/test;
import ballerina/http;
import ballerina/crypto;
import ballerina/io;

const string TRIGGER_TEST_SECRET = "trigger-test-secret";
const int TRIGGER_TEST_PORT = 9091;
const string TRIGGER_PAYLOAD_DIR = "tests/resources/trigger_payloads";

map<boolean> triggerFired = {};

listener Listener triggerTestListener = check new ({webhookSecret: TRIGGER_TEST_SECRET}, TRIGGER_TEST_PORT);

service PingService on triggerTestListener {
    remote function onPing(PingEvent payload) returns error? {
        triggerFired["PingService.onPing"] = true;
    }
}

service MetaService on triggerTestListener {
    remote function onMetaDeleted(MetaEvent payload) returns error? {
        triggerFired["MetaService.onMetaDeleted"] = true;
    }
}

service RepositoryDispatchService on triggerTestListener {
    remote function onRepositoryDispatch(RepositoryDispatchEvent payload) returns error? {
        triggerFired["RepositoryDispatchService.onRepositoryDispatch"] = true;
    }
}

service PushService on triggerTestListener {
    remote function onPush(PushEvent payload) returns error? {
        triggerFired["PushService.onPush"] = true;
    }
}

service IssuesService on triggerTestListener {
    remote function onIssuesReopened(IssuesEvent payload) returns error? {
    }
    remote function onIssuesTransferred(IssuesEvent payload) returns error? {
    }
    remote function onIssuesUnpinned(IssuesEvent payload) returns error? {
    }
    remote function onIssuesAssigned(IssuesEvent payload) returns error? {
    }
    remote function onIssuesMilestoned(IssuesEvent payload) returns error? {
    }
    remote function onIssuesLabeled(IssuesEvent payload) returns error? {
    }
    remote function onIssuesOpened(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesOpened"] = true;
    }
    remote function onIssuesPinned(IssuesEvent payload) returns error? {
    }
    remote function onIssuesTyped(IssuesEvent payload) returns error? {
    }
    remote function onIssuesEdited(IssuesEvent payload) returns error? {
    }
    remote function onIssuesUntyped(IssuesEvent payload) returns error? {
    }
    remote function onIssuesDemilestoned(IssuesEvent payload) returns error? {
    }
    remote function onIssuesLocked(IssuesEvent payload) returns error? {
    }
    remote function onIssuesUnassigned(IssuesEvent payload) returns error? {
    }
    remote function onIssuesUnlocked(IssuesEvent payload) returns error? {
    }
    remote function onIssuesUnlabeled(IssuesEvent payload) returns error? {
    }
    remote function onIssuesClosed(IssuesEvent payload) returns error? {
    }
    remote function onIssuesDeleted(IssuesEvent payload) returns error? {
    }
}

isolated function sendSignedTriggerWebhook(string githubEvent, string payloadFileName) returns http:Response|error {
    byte[] body = check io:fileReadBytes(string `${TRIGGER_PAYLOAD_DIR}/${payloadFileName}`);
    byte[] digest = check crypto:hmacSha256(body, TRIGGER_TEST_SECRET.toBytes());
    string signature = digest.toBase16();

    http:Client triggerClient = check new (string `http://localhost:${TRIGGER_TEST_PORT}`);
    http:Request request = new;
    request.setBinaryPayload(body, contentType = "application/json");
    request.setHeader("X-GitHub-Event", githubEvent);
    request.setHeader("X-Hub-Signature-256", signature);
    return triggerClient->post("/", request);
}

@test:Config {}
function testPingDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("ping", "ping.json");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PingService.onPing"] ?: false, "PingService.onPing should have fired");
}

@test:Config {}
function testIssuesOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_opened.json");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesOpened"] ?: false,
            "IssuesService.onIssuesOpened should have fired");
}

@test:Config {}
function testMetaDeletedDispatch() returns error? {
    // Regression test for the composite-identifier mismatch fix: meta's real payload always
    // includes action="deleted", so this must route to onMetaDeleted, not a bare onMeta.
    http:Response response = check sendSignedTriggerWebhook("meta", "meta.json");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MetaService.onMetaDeleted"] ?: false,
            "MetaService.onMetaDeleted should have fired");
}

@test:Config {}
function testRepositoryDispatchDispatch() returns error? {
    // Regression test for the free-form action fix: repository_dispatch's action is
    // caller-supplied, so this must route on the bare event type, not a guessed composite.
    http:Response response = check sendSignedTriggerWebhook("repository_dispatch", "repository_dispatch.json");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryDispatchService.onRepositoryDispatch"] ?: false,
            "RepositoryDispatchService.onRepositoryDispatch should have fired");
}

@test:Config {}
function testPushDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("push", "push.json");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PushService.onPush"] ?: false, "PushService.onPush should have fired");
}
