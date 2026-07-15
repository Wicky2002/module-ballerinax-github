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

import ballerina/crypto;
import ballerina/http;
import ballerina/io;
import ballerina/test;

const string TRIGGER_TEST_SECRET = "trigger-test-secret";
const int TRIGGER_TEST_PORT = 9091;
const string TRIGGER_PAYLOAD_DIR = "tests/resources/trigger_payloads";

map<boolean> triggerFired = {};

listener Listener triggerTestListener = check new ({webhookSecret: TRIGGER_TEST_SECRET}, TRIGGER_TEST_PORT);

service CheckSuiteService on triggerTestListener {
    remote function onCheckSuiteCompleted(CheckSuiteEvent payload) returns error? {
        triggerFired["CheckSuiteService.onCheckSuiteCompleted"] = true;
    }

    remote function onCheckSuiteRequested(CheckSuiteEvent payload) returns error? {
        triggerFired["CheckSuiteService.onCheckSuiteRequested"] = true;
    }

    remote function onCheckSuiteRerequested(CheckSuiteEvent payload) returns error? {
        triggerFired["CheckSuiteService.onCheckSuiteRerequested"] = true;
    }
}

service SecretScanningAlertService on triggerTestListener {
    remote function onSecretScanningAlertAssigned(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertAssigned"] = true;
    }

    remote function onSecretScanningAlertReopened(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertReopened"] = true;
    }

    remote function onSecretScanningAlertUnassigned(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertUnassigned"] = true;
    }

    remote function onSecretScanningAlertCreated(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertCreated"] = true;
    }

    remote function onSecretScanningAlertPubliclyLeaked(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"] = true;
    }

    remote function onSecretScanningAlertValidated(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertValidated"] = true;
    }

    remote function onSecretScanningAlertResolved(SecretScanningAlertEvent payload) returns error? {
        triggerFired["SecretScanningAlertService.onSecretScanningAlertResolved"] = true;
    }
}

service PushService on triggerTestListener {
    remote function onPush(PushEvent payload) returns error? {
        triggerFired["PushService.onPush"] = true;
    }
}

service CodeScanningAlertService on triggerTestListener {
    remote function onCodeScanningAlertAppearedInBranch(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] = true;
    }

    remote function onCodeScanningAlertClosedByUser(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] = true;
    }

    remote function onCodeScanningAlertCreated(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertCreated"] = true;
    }

    remote function onCodeScanningAlertFixed(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertFixed"] = true;
    }

    remote function onCodeScanningAlertReopened(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertReopened"] = true;
    }

    remote function onCodeScanningAlertReopenedByUser(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] = true;
    }

    remote function onCodeScanningAlertUpdatedAssignment(CodeScanningAlertEvent payload) returns error? {
        triggerFired["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] = true;
    }
}

service PersonalAccessTokenRequestService on triggerTestListener {
    remote function onPersonalAccessTokenRequestCreated(PersonalAccessTokenRequestEvent payload) returns error? {
        triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] = true;
    }

    remote function onPersonalAccessTokenRequestApproved(PersonalAccessTokenRequestEvent payload) returns error? {
        triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] = true;
    }

    remote function onPersonalAccessTokenRequestDenied(PersonalAccessTokenRequestEvent payload) returns error? {
        triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] = true;
    }

    remote function onPersonalAccessTokenRequestCancelled(PersonalAccessTokenRequestEvent payload) returns error? {
        triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] = true;
    }
}

service InstallationTargetService on triggerTestListener {
    remote function onInstallationTargetRenamed(InstallationTargetEvent payload) returns error? {
        triggerFired["InstallationTargetService.onInstallationTargetRenamed"] = true;
    }
}

service ProjectService on triggerTestListener {
    remote function onProjectDeleted(ProjectEvent payload) returns error? {
        triggerFired["ProjectService.onProjectDeleted"] = true;
    }

    remote function onProjectCreated(ProjectEvent payload) returns error? {
        triggerFired["ProjectService.onProjectCreated"] = true;
    }

    remote function onProjectClosed(ProjectEvent payload) returns error? {
        triggerFired["ProjectService.onProjectClosed"] = true;
    }

    remote function onProjectReopened(ProjectEvent payload) returns error? {
        triggerFired["ProjectService.onProjectReopened"] = true;
    }

    remote function onProjectEdited(ProjectEvent payload) returns error? {
        triggerFired["ProjectService.onProjectEdited"] = true;
    }
}

service ReleaseService on triggerTestListener {
    remote function onReleaseCreated(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleaseCreated"] = true;
    }

    remote function onReleasePublished(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleasePublished"] = true;
    }

    remote function onReleaseReleased(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleaseReleased"] = true;
    }

    remote function onReleasePrereleased(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleasePrereleased"] = true;
    }

    remote function onReleaseUnpublished(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleaseUnpublished"] = true;
    }

    remote function onReleaseDeleted(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleaseDeleted"] = true;
    }

    remote function onReleaseEdited(ReleaseEvent payload) returns error? {
        triggerFired["ReleaseService.onReleaseEdited"] = true;
    }
}

service IssueCommentService on triggerTestListener {
    remote function onIssueCommentEdited(IssueCommentEvent payload) returns error? {
        triggerFired["IssueCommentService.onIssueCommentEdited"] = true;
    }

    remote function onIssueCommentPinned(IssueCommentEvent payload) returns error? {
        triggerFired["IssueCommentService.onIssueCommentPinned"] = true;
    }

    remote function onIssueCommentDeleted(IssueCommentEvent payload) returns error? {
        triggerFired["IssueCommentService.onIssueCommentDeleted"] = true;
    }

    remote function onIssueCommentCreated(IssueCommentEvent payload) returns error? {
        triggerFired["IssueCommentService.onIssueCommentCreated"] = true;
    }

    remote function onIssueCommentUnpinned(IssueCommentEvent payload) returns error? {
        triggerFired["IssueCommentService.onIssueCommentUnpinned"] = true;
    }
}

service InstallationService on triggerTestListener {
    remote function onInstallationNewPermissionsAccepted(InstallationEvent payload) returns error? {
        triggerFired["InstallationService.onInstallationNewPermissionsAccepted"] = true;
    }

    remote function onInstallationSuspend(InstallationEvent payload) returns error? {
        triggerFired["InstallationService.onInstallationSuspend"] = true;
    }

    remote function onInstallationCreated(InstallationEvent payload) returns error? {
        triggerFired["InstallationService.onInstallationCreated"] = true;
    }

    remote function onInstallationDeleted(InstallationEvent payload) returns error? {
        triggerFired["InstallationService.onInstallationDeleted"] = true;
    }

    remote function onInstallationUnsuspend(InstallationEvent payload) returns error? {
        triggerFired["InstallationService.onInstallationUnsuspend"] = true;
    }
}

service PullRequestReviewCommentService on triggerTestListener {
    remote function onPullRequestReviewCommentCreated(PullRequestReviewCommentEvent payload) returns error? {
        triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] = true;
    }

    remote function onPullRequestReviewCommentDeleted(PullRequestReviewCommentEvent payload) returns error? {
        triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] = true;
    }

    remote function onPullRequestReviewCommentEdited(PullRequestReviewCommentEvent payload) returns error? {
        triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] = true;
    }
}

service MetaService on triggerTestListener {
    remote function onMetaDeleted(MetaEvent payload) returns error? {
        triggerFired["MetaService.onMetaDeleted"] = true;
    }
}

service PublicService on triggerTestListener {
    remote function onPublic(PublicEvent payload) returns error? {
        triggerFired["PublicService.onPublic"] = true;
    }
}

service DeploymentStatusService on triggerTestListener {
    remote function onDeploymentStatusCreated(DeploymentStatusEvent payload) returns error? {
        triggerFired["DeploymentStatusService.onDeploymentStatusCreated"] = true;
    }
}

service CustomPropertyService on triggerTestListener {
    remote function onCustomPropertyUpdated(CustomPropertyEvent payload) returns error? {
        triggerFired["CustomPropertyService.onCustomPropertyUpdated"] = true;
    }

    remote function onCustomPropertyDeleted(CustomPropertyEvent payload) returns error? {
        triggerFired["CustomPropertyService.onCustomPropertyDeleted"] = true;
    }

    remote function onCustomPropertyPromoteToEnterprise(CustomPropertyEvent payload) returns error? {
        triggerFired["CustomPropertyService.onCustomPropertyPromoteToEnterprise"] = true;
    }

    remote function onCustomPropertyCreated(CustomPropertyEvent payload) returns error? {
        triggerFired["CustomPropertyService.onCustomPropertyCreated"] = true;
    }
}

service SecurityAdvisoryService on triggerTestListener {
    remote function onSecurityAdvisoryWithdrawn(SecurityAdvisoryEvent payload) returns error? {
        triggerFired["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] = true;
    }

    remote function onSecurityAdvisoryPublished(SecurityAdvisoryEvent payload) returns error? {
        triggerFired["SecurityAdvisoryService.onSecurityAdvisoryPublished"] = true;
    }

    remote function onSecurityAdvisoryUpdated(SecurityAdvisoryEvent payload) returns error? {
        triggerFired["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] = true;
    }
}

service DiscussionService on triggerTestListener {
    remote function onDiscussionUnanswered(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionUnanswered"] = true;
    }

    remote function onDiscussionCreated(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionCreated"] = true;
    }

    remote function onDiscussionTransferred(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionTransferred"] = true;
    }

    remote function onDiscussionCategoryChanged(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionCategoryChanged"] = true;
    }

    remote function onDiscussionDeleted(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionDeleted"] = true;
    }

    remote function onDiscussionUnlocked(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionUnlocked"] = true;
    }

    remote function onDiscussionPinned(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionPinned"] = true;
    }

    remote function onDiscussionEdited(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionEdited"] = true;
    }

    remote function onDiscussionReopened(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionReopened"] = true;
    }

    remote function onDiscussionAnswered(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionAnswered"] = true;
    }

    remote function onDiscussionClosed(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionClosed"] = true;
    }

    remote function onDiscussionUnlabeled(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionUnlabeled"] = true;
    }

    remote function onDiscussionLabeled(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionLabeled"] = true;
    }

    remote function onDiscussionUnpinned(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionUnpinned"] = true;
    }

    remote function onDiscussionLocked(DiscussionEvent payload) returns error? {
        triggerFired["DiscussionService.onDiscussionLocked"] = true;
    }
}

service MergeGroupService on triggerTestListener {
    remote function onMergeGroupDestroyed(MergeGroupEvent payload) returns error? {
        triggerFired["MergeGroupService.onMergeGroupDestroyed"] = true;
    }

    remote function onMergeGroupChecksRequested(MergeGroupEvent payload) returns error? {
        triggerFired["MergeGroupService.onMergeGroupChecksRequested"] = true;
    }
}

service MarketplacePurchaseService on triggerTestListener {
    remote function onMarketplacePurchasePurchased(MarketplacePurchaseEvent payload) returns error? {
        triggerFired["MarketplacePurchaseService.onMarketplacePurchasePurchased"] = true;
    }

    remote function onMarketplacePurchaseCancelled(MarketplacePurchaseEvent payload) returns error? {
        triggerFired["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] = true;
    }

    remote function onMarketplacePurchasePendingChangeCancelled(MarketplacePurchaseEvent payload) returns error? {
        triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] = true;
    }

    remote function onMarketplacePurchasePendingChange(MarketplacePurchaseEvent payload) returns error? {
        triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] = true;
    }

    remote function onMarketplacePurchaseChanged(MarketplacePurchaseEvent payload) returns error? {
        triggerFired["MarketplacePurchaseService.onMarketplacePurchaseChanged"] = true;
    }
}

service ProjectColumnService on triggerTestListener {
    remote function onProjectColumnMoved(ProjectColumnEvent payload) returns error? {
        triggerFired["ProjectColumnService.onProjectColumnMoved"] = true;
    }

    remote function onProjectColumnEdited(ProjectColumnEvent payload) returns error? {
        triggerFired["ProjectColumnService.onProjectColumnEdited"] = true;
    }

    remote function onProjectColumnDeleted(ProjectColumnEvent payload) returns error? {
        triggerFired["ProjectColumnService.onProjectColumnDeleted"] = true;
    }

    remote function onProjectColumnCreated(ProjectColumnEvent payload) returns error? {
        triggerFired["ProjectColumnService.onProjectColumnCreated"] = true;
    }
}

service MembershipService on triggerTestListener {
    remote function onMembershipAdded(MembershipEvent payload) returns error? {
        triggerFired["MembershipService.onMembershipAdded"] = true;
    }

    remote function onMembershipRemoved(MembershipEvent payload) returns error? {
        triggerFired["MembershipService.onMembershipRemoved"] = true;
    }
}

service WatchService on triggerTestListener {
    remote function onWatchStarted(WatchEvent payload) returns error? {
        triggerFired["WatchService.onWatchStarted"] = true;
    }
}

service LabelService on triggerTestListener {
    remote function onLabelEdited(LabelEvent payload) returns error? {
        triggerFired["LabelService.onLabelEdited"] = true;
    }

    remote function onLabelCreated(LabelEvent payload) returns error? {
        triggerFired["LabelService.onLabelCreated"] = true;
    }

    remote function onLabelDeleted(LabelEvent payload) returns error? {
        triggerFired["LabelService.onLabelDeleted"] = true;
    }
}

service DeleteService on triggerTestListener {
    remote function onDelete(DeleteEvent payload) returns error? {
        triggerFired["DeleteService.onDelete"] = true;
    }
}

service GithubAppAuthorizationService on triggerTestListener {
    remote function onGithubAppAuthorizationRevoked(GithubAppAuthorizationEvent payload) returns error? {
        triggerFired["GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"] = true;
    }
}

service OrganizationService on triggerTestListener {
    remote function onOrganizationMemberAdded(OrganizationEvent payload) returns error? {
        triggerFired["OrganizationService.onOrganizationMemberAdded"] = true;
    }

    remote function onOrganizationMemberRemoved(OrganizationEvent payload) returns error? {
        triggerFired["OrganizationService.onOrganizationMemberRemoved"] = true;
    }

    remote function onOrganizationDeleted(OrganizationEvent payload) returns error? {
        triggerFired["OrganizationService.onOrganizationDeleted"] = true;
    }

    remote function onOrganizationRenamed(OrganizationEvent payload) returns error? {
        triggerFired["OrganizationService.onOrganizationRenamed"] = true;
    }

    remote function onOrganizationMemberInvited(OrganizationEvent payload) returns error? {
        triggerFired["OrganizationService.onOrganizationMemberInvited"] = true;
    }
}

service WorkflowJobService on triggerTestListener {
    remote function onWorkflowJobQueued(WorkflowJobEvent payload) returns error? {
        triggerFired["WorkflowJobService.onWorkflowJobQueued"] = true;
    }

    remote function onWorkflowJobWaiting(WorkflowJobEvent payload) returns error? {
        triggerFired["WorkflowJobService.onWorkflowJobWaiting"] = true;
    }

    remote function onWorkflowJobCompleted(WorkflowJobEvent payload) returns error? {
        triggerFired["WorkflowJobService.onWorkflowJobCompleted"] = true;
    }

    remote function onWorkflowJobInProgress(WorkflowJobEvent payload) returns error? {
        triggerFired["WorkflowJobService.onWorkflowJobInProgress"] = true;
    }
}

service SecurityAndAnalysisService on triggerTestListener {
    remote function onSecurityAndAnalysis(SecurityAndAnalysisEvent payload) returns error? {
        triggerFired["SecurityAndAnalysisService.onSecurityAndAnalysis"] = true;
    }
}

service PullRequestService on triggerTestListener {
    remote function onPullRequestEnqueued(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestEnqueued"] = true;
    }

    remote function onPullRequestReviewRequestRemoved(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestReviewRequestRemoved"] = true;
    }

    remote function onPullRequestOpened(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestOpened"] = true;
    }

    remote function onPullRequestReadyForReview(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestReadyForReview"] = true;
    }

    remote function onPullRequestLabeled(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestLabeled"] = true;
    }

    remote function onPullRequestUnassigned(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestUnassigned"] = true;
    }

    remote function onPullRequestEdited(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestEdited"] = true;
    }

    remote function onPullRequestSynchronize(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestSynchronize"] = true;
    }

    remote function onPullRequestReviewRequested(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestReviewRequested"] = true;
    }

    remote function onPullRequestReopened(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestReopened"] = true;
    }

    remote function onPullRequestAutoMergeDisabled(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestAutoMergeDisabled"] = true;
    }

    remote function onPullRequestLocked(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestLocked"] = true;
    }

    remote function onPullRequestAutoMergeEnabled(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestAutoMergeEnabled"] = true;
    }

    remote function onPullRequestMilestoned(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestMilestoned"] = true;
    }

    remote function onPullRequestDequeued(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestDequeued"] = true;
    }

    remote function onPullRequestUnlabeled(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestUnlabeled"] = true;
    }

    remote function onPullRequestClosed(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestClosed"] = true;
    }

    remote function onPullRequestUnlocked(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestUnlocked"] = true;
    }

    remote function onPullRequestAssigned(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestAssigned"] = true;
    }

    remote function onPullRequestConvertedToDraft(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestConvertedToDraft"] = true;
    }

    remote function onPullRequestDemilestoned(PullRequestEvent payload) returns error? {
        triggerFired["PullRequestService.onPullRequestDemilestoned"] = true;
    }
}

service ProjectsV2statusUpdateService on triggerTestListener {
    remote function onProjectsV2StatusUpdateEdited('ProjectsV2StatusUpdateEvent payload) returns error? {
        triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] = true;
    }

    remote function onProjectsV2StatusUpdateDeleted('ProjectsV2StatusUpdateEvent payload) returns error? {
        triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] = true;
    }

    remote function onProjectsV2StatusUpdateCreated('ProjectsV2StatusUpdateEvent payload) returns error? {
        triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] = true;
    }
}

service GollumService on triggerTestListener {
    remote function onGollum(GollumEvent payload) returns error? {
        triggerFired["GollumService.onGollum"] = true;
    }
}

service DeploymentService on triggerTestListener {
    remote function onDeploymentCreated(DeploymentEvent payload) returns error? {
        triggerFired["DeploymentService.onDeploymentCreated"] = true;
    }
}

service PageBuildService on triggerTestListener {
    remote function onPageBuild(PageBuildEvent payload) returns error? {
        triggerFired["PageBuildService.onPageBuild"] = true;
    }
}

service RepositoryImportService on triggerTestListener {
    remote function onRepositoryImport(RepositoryImportEvent payload) returns error? {
        triggerFired["RepositoryImportService.onRepositoryImport"] = true;
    }
}

service BranchProtectionRuleService on triggerTestListener {
    remote function onBranchProtectionRuleDeleted(BranchProtectionRuleEvent payload) returns error? {
        triggerFired["BranchProtectionRuleService.onBranchProtectionRuleDeleted"] = true;
    }

    remote function onBranchProtectionRuleEdited(BranchProtectionRuleEvent payload) returns error? {
        triggerFired["BranchProtectionRuleService.onBranchProtectionRuleEdited"] = true;
    }

    remote function onBranchProtectionRuleCreated(BranchProtectionRuleEvent payload) returns error? {
        triggerFired["BranchProtectionRuleService.onBranchProtectionRuleCreated"] = true;
    }
}

service DependabotAlertService on triggerTestListener {
    remote function onDependabotAlertAutoDismissed(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertAutoDismissed"] = true;
    }

    remote function onDependabotAlertAutoReopened(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertAutoReopened"] = true;
    }

    remote function onDependabotAlertCreated(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertCreated"] = true;
    }

    remote function onDependabotAlertDismissed(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertDismissed"] = true;
    }

    remote function onDependabotAlertReopened(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertReopened"] = true;
    }

    remote function onDependabotAlertReintroduced(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertReintroduced"] = true;
    }

    remote function onDependabotAlertAssigneesChanged(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertAssigneesChanged"] = true;
    }

    remote function onDependabotAlertFixed(DependabotAlertEvent payload) returns error? {
        triggerFired["DependabotAlertService.onDependabotAlertFixed"] = true;
    }
}

service TeamService on triggerTestListener {
    remote function onTeamCreated(TeamEvent payload) returns error? {
        triggerFired["TeamService.onTeamCreated"] = true;
    }

    remote function onTeamDeleted(TeamEvent payload) returns error? {
        triggerFired["TeamService.onTeamDeleted"] = true;
    }

    remote function onTeamEdited(TeamEvent payload) returns error? {
        triggerFired["TeamService.onTeamEdited"] = true;
    }

    remote function onTeamAddedToRepository(TeamEvent payload) returns error? {
        triggerFired["TeamService.onTeamAddedToRepository"] = true;
    }

    remote function onTeamRemovedFromRepository(TeamEvent payload) returns error? {
        triggerFired["TeamService.onTeamRemovedFromRepository"] = true;
    }
}

service SecretScanningAlertLocationService on triggerTestListener {
    remote function onSecretScanningAlertLocation(SecretScanningAlertLocationEvent payload) returns error? {
        triggerFired["SecretScanningAlertLocationService.onSecretScanningAlertLocation"] = true;
    }
}

service WorkflowRunService on triggerTestListener {
    remote function onWorkflowRunInProgress(WorkflowRunEvent payload) returns error? {
        triggerFired["WorkflowRunService.onWorkflowRunInProgress"] = true;
    }

    remote function onWorkflowRunCompleted(WorkflowRunEvent payload) returns error? {
        triggerFired["WorkflowRunService.onWorkflowRunCompleted"] = true;
    }

    remote function onWorkflowRunRequested(WorkflowRunEvent payload) returns error? {
        triggerFired["WorkflowRunService.onWorkflowRunRequested"] = true;
    }
}

service DeployKeyService on triggerTestListener {
    remote function onDeployKeyCreated(DeployKeyEvent payload) returns error? {
        triggerFired["DeployKeyService.onDeployKeyCreated"] = true;
    }

    remote function onDeployKeyDeleted(DeployKeyEvent payload) returns error? {
        triggerFired["DeployKeyService.onDeployKeyDeleted"] = true;
    }
}

service StarService on triggerTestListener {
    remote function onStarCreated(StarEvent payload) returns error? {
        triggerFired["StarService.onStarCreated"] = true;
    }

    remote function onStarDeleted(StarEvent payload) returns error? {
        triggerFired["StarService.onStarDeleted"] = true;
    }
}

service RegistryPackageService on triggerTestListener {
    remote function onRegistryPackageUpdated(RegistryPackageEvent payload) returns error? {
        triggerFired["RegistryPackageService.onRegistryPackageUpdated"] = true;
    }

    remote function onRegistryPackagePublished(RegistryPackageEvent payload) returns error? {
        triggerFired["RegistryPackageService.onRegistryPackagePublished"] = true;
    }
}

service RepositoryRulesetService on triggerTestListener {
    remote function onRepositoryRulesetCreated(RepositoryRulesetEvent payload) returns error? {
        triggerFired["RepositoryRulesetService.onRepositoryRulesetCreated"] = true;
    }

    remote function onRepositoryRulesetEdited(RepositoryRulesetEvent payload) returns error? {
        triggerFired["RepositoryRulesetService.onRepositoryRulesetEdited"] = true;
    }

    remote function onRepositoryRulesetDeleted(RepositoryRulesetEvent payload) returns error? {
        triggerFired["RepositoryRulesetService.onRepositoryRulesetDeleted"] = true;
    }
}

service OrgBlockService on triggerTestListener {
    remote function onOrgBlockBlocked(OrgBlockEvent payload) returns error? {
        triggerFired["OrgBlockService.onOrgBlockBlocked"] = true;
    }

    remote function onOrgBlockUnblocked(OrgBlockEvent payload) returns error? {
        triggerFired["OrgBlockService.onOrgBlockUnblocked"] = true;
    }
}

service PullRequestReviewService on triggerTestListener {
    remote function onPullRequestReviewSubmitted(PullRequestReviewEvent payload) returns error? {
        triggerFired["PullRequestReviewService.onPullRequestReviewSubmitted"] = true;
    }

    remote function onPullRequestReviewEdited(PullRequestReviewEvent payload) returns error? {
        triggerFired["PullRequestReviewService.onPullRequestReviewEdited"] = true;
    }

    remote function onPullRequestReviewDismissed(PullRequestReviewEvent payload) returns error? {
        triggerFired["PullRequestReviewService.onPullRequestReviewDismissed"] = true;
    }
}

service InstallationRepositoriesService on triggerTestListener {
    remote function onInstallationRepositoriesRemoved(InstallationRepositoriesEvent payload) returns error? {
        triggerFired["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] = true;
    }

    remote function onInstallationRepositoriesAdded(InstallationRepositoriesEvent payload) returns error? {
        triggerFired["InstallationRepositoriesService.onInstallationRepositoriesAdded"] = true;
    }
}

service IssuesService on triggerTestListener {
    remote function onIssuesReopened(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesReopened"] = true;
    }

    remote function onIssuesTransferred(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesTransferred"] = true;
    }

    remote function onIssuesUnpinned(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesUnpinned"] = true;
    }

    remote function onIssuesAssigned(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesAssigned"] = true;
    }

    remote function onIssuesMilestoned(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesMilestoned"] = true;
    }

    remote function onIssuesLabeled(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesLabeled"] = true;
    }

    remote function onIssuesOpened(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesOpened"] = true;
    }

    remote function onIssuesPinned(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesPinned"] = true;
    }

    remote function onIssuesTyped(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesTyped"] = true;
    }

    remote function onIssuesEdited(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesEdited"] = true;
    }

    remote function onIssuesUntyped(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesUntyped"] = true;
    }

    remote function onIssuesDemilestoned(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesDemilestoned"] = true;
    }

    remote function onIssuesLocked(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesLocked"] = true;
    }

    remote function onIssuesUnassigned(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesUnassigned"] = true;
    }

    remote function onIssuesUnlocked(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesUnlocked"] = true;
    }

    remote function onIssuesUnlabeled(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesUnlabeled"] = true;
    }

    remote function onIssuesClosed(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesClosed"] = true;
    }

    remote function onIssuesDeleted(IssuesEvent payload) returns error? {
        triggerFired["IssuesService.onIssuesDeleted"] = true;
    }
}

service CheckRunService on triggerTestListener {
    remote function onCheckRunCreated(CheckRunEvent payload) returns error? {
        triggerFired["CheckRunService.onCheckRunCreated"] = true;
    }

    remote function onCheckRunCompleted(CheckRunEvent payload) returns error? {
        triggerFired["CheckRunService.onCheckRunCompleted"] = true;
    }

    remote function onCheckRunRequestedAction(CheckRunEvent payload) returns error? {
        triggerFired["CheckRunService.onCheckRunRequestedAction"] = true;
    }

    remote function onCheckRunRerequested(CheckRunEvent payload) returns error? {
        triggerFired["CheckRunService.onCheckRunRerequested"] = true;
    }
}

service DiscussionCommentService on triggerTestListener {
    remote function onDiscussionCommentDeleted(DiscussionCommentEvent payload) returns error? {
        triggerFired["DiscussionCommentService.onDiscussionCommentDeleted"] = true;
    }

    remote function onDiscussionCommentCreated(DiscussionCommentEvent payload) returns error? {
        triggerFired["DiscussionCommentService.onDiscussionCommentCreated"] = true;
    }

    remote function onDiscussionCommentEdited(DiscussionCommentEvent payload) returns error? {
        triggerFired["DiscussionCommentService.onDiscussionCommentEdited"] = true;
    }
}

service CustomPropertyValuesService on triggerTestListener {
    remote function onCustomPropertyValuesUpdated(CustomPropertyValuesEvent payload) returns error? {
        triggerFired["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] = true;
    }
}

service CommitCommentService on triggerTestListener {
    remote function onCommitCommentCreated(CommitCommentEvent payload) returns error? {
        triggerFired["CommitCommentService.onCommitCommentCreated"] = true;
    }
}

service ForkService on triggerTestListener {
    remote function onFork(ForkEvent payload) returns error? {
        triggerFired["ForkService.onFork"] = true;
    }
}

service SponsorshipService on triggerTestListener {
    remote function onSponsorshipCancelled(SponsorshipEvent payload) returns error? {
        triggerFired["SponsorshipService.onSponsorshipCancelled"] = true;
    }

    remote function onSponsorshipEdited(SponsorshipEvent payload) returns error? {
        triggerFired["SponsorshipService.onSponsorshipEdited"] = true;
    }

    remote function onSponsorshipTierChanged(SponsorshipEvent payload) returns error? {
        triggerFired["SponsorshipService.onSponsorshipTierChanged"] = true;
    }

    remote function onSponsorshipPendingCancellation(SponsorshipEvent payload) returns error? {
        triggerFired["SponsorshipService.onSponsorshipPendingCancellation"] = true;
    }

    remote function onSponsorshipCreated(SponsorshipEvent payload) returns error? {
        triggerFired["SponsorshipService.onSponsorshipCreated"] = true;
    }

    remote function onSponsorshipPendingTierChange(SponsorshipEvent payload) returns error? {
        triggerFired["SponsorshipService.onSponsorshipPendingTierChange"] = true;
    }
}

service PullRequestReviewThreadService on triggerTestListener {
    remote function onPullRequestReviewThreadUnresolved(PullRequestReviewThreadEvent payload) returns error? {
        triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] = true;
    }

    remote function onPullRequestReviewThreadResolved(PullRequestReviewThreadEvent payload) returns error? {
        triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] = true;
    }
}

service RepositoryDispatchService on triggerTestListener {
    remote function onRepositoryDispatch(RepositoryDispatchEvent payload) returns error? {
        triggerFired["RepositoryDispatchService.onRepositoryDispatch"] = true;
    }
}

service DeploymentProtectionRuleService on triggerTestListener {
    remote function onDeploymentProtectionRule(DeploymentProtectionRuleEvent payload) returns error? {
        triggerFired["DeploymentProtectionRuleService.onDeploymentProtectionRule"] = true;
    }
}

service CreateService on triggerTestListener {
    remote function onCreate(CreateEvent payload) returns error? {
        triggerFired["CreateService.onCreate"] = true;
    }
}

service WorkflowDispatchService on triggerTestListener {
    remote function onWorkflowDispatch(WorkflowDispatchEvent payload) returns error? {
        triggerFired["WorkflowDispatchService.onWorkflowDispatch"] = true;
    }
}

service BranchProtectionConfigurationService on triggerTestListener {
    remote function onBranchProtectionConfigurationEnabled(BranchProtectionConfigurationEvent payload) returns error? {
        triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"] = true;
    }

    remote function onBranchProtectionConfigurationDisabled(BranchProtectionConfigurationEvent payload) returns error? {
        triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"] = true;
    }
}

service ProjectsV2Service on triggerTestListener {
    remote function onProjectsV2Created('ProjectsV2Event payload) returns error? {
        triggerFired["ProjectsV2Service.onProjectsV2Created"] = true;
    }

    remote function onProjectsV2Edited('ProjectsV2Event payload) returns error? {
        triggerFired["ProjectsV2Service.onProjectsV2Edited"] = true;
    }

    remote function onProjectsV2Closed('ProjectsV2Event payload) returns error? {
        triggerFired["ProjectsV2Service.onProjectsV2Closed"] = true;
    }

    remote function onProjectsV2Reopened('ProjectsV2Event payload) returns error? {
        triggerFired["ProjectsV2Service.onProjectsV2Reopened"] = true;
    }

    remote function onProjectsV2Deleted('ProjectsV2Event payload) returns error? {
        triggerFired["ProjectsV2Service.onProjectsV2Deleted"] = true;
    }
}

service ProjectCardService on triggerTestListener {
    remote function onProjectCardEdited(ProjectCardEvent payload) returns error? {
        triggerFired["ProjectCardService.onProjectCardEdited"] = true;
    }

    remote function onProjectCardDeleted(ProjectCardEvent payload) returns error? {
        triggerFired["ProjectCardService.onProjectCardDeleted"] = true;
    }

    remote function onProjectCardMoved(ProjectCardEvent payload) returns error? {
        triggerFired["ProjectCardService.onProjectCardMoved"] = true;
    }

    remote function onProjectCardConverted(ProjectCardEvent payload) returns error? {
        triggerFired["ProjectCardService.onProjectCardConverted"] = true;
    }

    remote function onProjectCardCreated(ProjectCardEvent payload) returns error? {
        triggerFired["ProjectCardService.onProjectCardCreated"] = true;
    }
}

service SubIssuesService on triggerTestListener {
    remote function onSubIssuesSubIssueAdded(SubIssuesEvent payload) returns error? {
        triggerFired["SubIssuesService.onSubIssuesSubIssueAdded"] = true;
    }

    remote function onSubIssuesParentIssueAdded(SubIssuesEvent payload) returns error? {
        triggerFired["SubIssuesService.onSubIssuesParentIssueAdded"] = true;
    }

    remote function onSubIssuesSubIssueRemoved(SubIssuesEvent payload) returns error? {
        triggerFired["SubIssuesService.onSubIssuesSubIssueRemoved"] = true;
    }

    remote function onSubIssuesParentIssueRemoved(SubIssuesEvent payload) returns error? {
        triggerFired["SubIssuesService.onSubIssuesParentIssueRemoved"] = true;
    }
}

service PingService on triggerTestListener {
    remote function onPing(PingEvent payload) returns error? {
        triggerFired["PingService.onPing"] = true;
    }
}

service PackageService on triggerTestListener {
    remote function onPackagePublished(PackageEvent payload) returns error? {
        triggerFired["PackageService.onPackagePublished"] = true;
    }

    remote function onPackageUpdated(PackageEvent payload) returns error? {
        triggerFired["PackageService.onPackageUpdated"] = true;
    }
}

service RepositoryService on triggerTestListener {
    remote function onRepositoryPrivatized(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryPrivatized"] = true;
    }

    remote function onRepositoryCreated(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryCreated"] = true;
    }

    remote function onRepositoryRenamed(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryRenamed"] = true;
    }

    remote function onRepositoryTransferred(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryTransferred"] = true;
    }

    remote function onRepositoryEdited(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryEdited"] = true;
    }

    remote function onRepositoryDeleted(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryDeleted"] = true;
    }

    remote function onRepositoryArchived(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryArchived"] = true;
    }

    remote function onRepositoryPublicized(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryPublicized"] = true;
    }

    remote function onRepositoryUnarchived(RepositoryEvent payload) returns error? {
        triggerFired["RepositoryService.onRepositoryUnarchived"] = true;
    }
}

service MemberService on triggerTestListener {
    remote function onMemberEdited(MemberEvent payload) returns error? {
        triggerFired["MemberService.onMemberEdited"] = true;
    }

    remote function onMemberAdded(MemberEvent payload) returns error? {
        triggerFired["MemberService.onMemberAdded"] = true;
    }

    remote function onMemberRemoved(MemberEvent payload) returns error? {
        triggerFired["MemberService.onMemberRemoved"] = true;
    }
}

service SecretScanningScanService on triggerTestListener {
    remote function onSecretScanningScan(SecretScanningScanEvent payload) returns error? {
        triggerFired["SecretScanningScanService.onSecretScanningScan"] = true;
    }
}

service StatusService on triggerTestListener {
    remote function onStatus(StatusEvent payload) returns error? {
        triggerFired["StatusService.onStatus"] = true;
    }
}

service DeploymentReviewService on triggerTestListener {
    remote function onDeploymentReviewRequested(DeploymentReviewEvent payload) returns error? {
        triggerFired["DeploymentReviewService.onDeploymentReviewRequested"] = true;
    }

    remote function onDeploymentReviewRejected(DeploymentReviewEvent payload) returns error? {
        triggerFired["DeploymentReviewService.onDeploymentReviewRejected"] = true;
    }

    remote function onDeploymentReviewApproved(DeploymentReviewEvent payload) returns error? {
        triggerFired["DeploymentReviewService.onDeploymentReviewApproved"] = true;
    }
}

service ProjectsV2itemService on triggerTestListener {
    remote function onProjectsV2ItemEdited('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemEdited"] = true;
    }

    remote function onProjectsV2ItemCreated('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemCreated"] = true;
    }

    remote function onProjectsV2ItemArchived('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemArchived"] = true;
    }

    remote function onProjectsV2ItemDeleted('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemDeleted"] = true;
    }

    remote function onProjectsV2ItemRestored('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemRestored"] = true;
    }

    remote function onProjectsV2ItemReordered('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemReordered"] = true;
    }

    remote function onProjectsV2ItemConverted('ProjectsV2ItemEvent payload) returns error? {
        triggerFired["ProjectsV2itemService.onProjectsV2ItemConverted"] = true;
    }
}

service RepositoryVulnerabilityAlertService on triggerTestListener {
    remote function onRepositoryVulnerabilityAlertResolve(RepositoryVulnerabilityAlertEvent payload) returns error? {
        triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"] = true;
    }

    remote function onRepositoryVulnerabilityAlertReopen(RepositoryVulnerabilityAlertEvent payload) returns error? {
        triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"] = true;
    }

    remote function onRepositoryVulnerabilityAlertDismiss(RepositoryVulnerabilityAlertEvent payload) returns error? {
        triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"] = true;
    }

    remote function onRepositoryVulnerabilityAlertCreate(RepositoryVulnerabilityAlertEvent payload) returns error? {
        triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"] = true;
    }
}

service IssueDependenciesService on triggerTestListener {
    remote function onIssueDependenciesBlockingRemoved(IssueDependenciesEvent payload) returns error? {
        triggerFired["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] = true;
    }

    remote function onIssueDependenciesBlockedByRemoved(IssueDependenciesEvent payload) returns error? {
        triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] = true;
    }

    remote function onIssueDependenciesBlockingAdded(IssueDependenciesEvent payload) returns error? {
        triggerFired["IssueDependenciesService.onIssueDependenciesBlockingAdded"] = true;
    }

    remote function onIssueDependenciesBlockedByAdded(IssueDependenciesEvent payload) returns error? {
        triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] = true;
    }
}

service RepositoryAdvisoryService on triggerTestListener {
    remote function onRepositoryAdvisoryReported(RepositoryAdvisoryEvent payload) returns error? {
        triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] = true;
    }

    remote function onRepositoryAdvisoryPublished(RepositoryAdvisoryEvent payload) returns error? {
        triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] = true;
    }
}

service TeamAddService on triggerTestListener {
    remote function onTeamAdd(TeamAddEvent payload) returns error? {
        triggerFired["TeamAddService.onTeamAdd"] = true;
    }
}

service MilestoneService on triggerTestListener {
    remote function onMilestoneCreated(MilestoneEvent payload) returns error? {
        triggerFired["MilestoneService.onMilestoneCreated"] = true;
    }

    remote function onMilestoneEdited(MilestoneEvent payload) returns error? {
        triggerFired["MilestoneService.onMilestoneEdited"] = true;
    }

    remote function onMilestoneOpened(MilestoneEvent payload) returns error? {
        triggerFired["MilestoneService.onMilestoneOpened"] = true;
    }

    remote function onMilestoneDeleted(MilestoneEvent payload) returns error? {
        triggerFired["MilestoneService.onMilestoneDeleted"] = true;
    }

    remote function onMilestoneClosed(MilestoneEvent payload) returns error? {
        triggerFired["MilestoneService.onMilestoneClosed"] = true;
    }
}

isolated function sendSignedTriggerWebhook(string headerValue, string eventIdentifier) returns http:Response|error {
    byte[] body = check io:fileReadBytes(string `${TRIGGER_PAYLOAD_DIR}/${eventIdentifier}.json`);
    byte[] digest = check crypto:hmacSha256(body, TRIGGER_TEST_SECRET.toBytes());
    string signature = digest.toBase16();

    http:Client triggerClient = check new (string `http://localhost:${TRIGGER_TEST_PORT}`);
    http:Request request = new;
    request.setBinaryPayload(body, contentType = "application/json");
    request.setHeader("X-GitHub-Event", headerValue);
    request.setHeader("X-Hub-Signature-256", signature);
    return triggerClient->post("/", request);
}

@test:Config {}
function testCheckSuiteCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_completed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckSuiteService.onCheckSuiteCompleted"] ?: false, "CheckSuiteService.onCheckSuiteCompleted should have fired");
}

@test:Config {}
function testCheckSuiteRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_requested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckSuiteService.onCheckSuiteRequested"] ?: false, "CheckSuiteService.onCheckSuiteRequested should have fired");
}

@test:Config {}
function testCheckSuiteRerequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_rerequested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckSuiteService.onCheckSuiteRerequested"] ?: false, "CheckSuiteService.onCheckSuiteRerequested should have fired");
}

@test:Config {}
function testSecretScanningAlertAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_assigned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertAssigned"] ?: false, "SecretScanningAlertService.onSecretScanningAlertAssigned should have fired");
}

@test:Config {}
function testSecretScanningAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertReopened"] ?: false, "SecretScanningAlertService.onSecretScanningAlertReopened should have fired");
}

@test:Config {}
function testSecretScanningAlertUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertUnassigned"] ?: false, "SecretScanningAlertService.onSecretScanningAlertUnassigned should have fired");
}

@test:Config {}
function testSecretScanningAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertCreated"] ?: false, "SecretScanningAlertService.onSecretScanningAlertCreated should have fired");
}

@test:Config {}
function testSecretScanningAlertPubliclyLeakedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_publicly_leaked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"] ?: false, "SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked should have fired");
}

@test:Config {}
function testSecretScanningAlertValidatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_validated");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertValidated"] ?: false, "SecretScanningAlertService.onSecretScanningAlertValidated should have fired");
}

@test:Config {}
function testSecretScanningAlertResolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_resolved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertService.onSecretScanningAlertResolved"] ?: false, "SecretScanningAlertService.onSecretScanningAlertResolved should have fired");
}

@test:Config {}
function testPushDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("push", "push");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PushService.onPush"] ?: false, "PushService.onPush should have fired");
}

@test:Config {}
function testCodeScanningAlertAppearedInBranchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_appeared_in_branch");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] ?: false, "CodeScanningAlertService.onCodeScanningAlertAppearedInBranch should have fired");
}

@test:Config {}
function testCodeScanningAlertClosedByUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_closed_by_user");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] ?: false, "CodeScanningAlertService.onCodeScanningAlertClosedByUser should have fired");
}

@test:Config {}
function testCodeScanningAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertCreated"] ?: false, "CodeScanningAlertService.onCodeScanningAlertCreated should have fired");
}

@test:Config {}
function testCodeScanningAlertFixedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_fixed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertFixed"] ?: false, "CodeScanningAlertService.onCodeScanningAlertFixed should have fired");
}

@test:Config {}
function testCodeScanningAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertReopened"] ?: false, "CodeScanningAlertService.onCodeScanningAlertReopened should have fired");
}

@test:Config {}
function testCodeScanningAlertReopenedByUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_reopened_by_user");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] ?: false, "CodeScanningAlertService.onCodeScanningAlertReopenedByUser should have fired");
}

@test:Config {}
function testCodeScanningAlertUpdatedAssignmentDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_updated_assignment");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] ?: false, "CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment should have fired");
}

@test:Config {}
function testPersonalAccessTokenRequestCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] ?: false, "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated should have fired");
}

@test:Config {}
function testPersonalAccessTokenRequestApprovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_approved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] ?: false, "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved should have fired");
}

@test:Config {}
function testPersonalAccessTokenRequestDeniedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_denied");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] ?: false, "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied should have fired");
}

@test:Config {}
function testPersonalAccessTokenRequestCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] ?: false, "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled should have fired");
}

@test:Config {}
function testInstallationTargetRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_target", "installation_target_renamed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationTargetService.onInstallationTargetRenamed"] ?: false, "InstallationTargetService.onInstallationTargetRenamed should have fired");
}

@test:Config {}
function testProjectDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectService.onProjectDeleted"] ?: false, "ProjectService.onProjectDeleted should have fired");
}

@test:Config {}
function testProjectCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectService.onProjectCreated"] ?: false, "ProjectService.onProjectCreated should have fired");
}

@test:Config {}
function testProjectClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_closed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectService.onProjectClosed"] ?: false, "ProjectService.onProjectClosed should have fired");
}

@test:Config {}
function testProjectReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectService.onProjectReopened"] ?: false, "ProjectService.onProjectReopened should have fired");
}

@test:Config {}
function testProjectEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectService.onProjectEdited"] ?: false, "ProjectService.onProjectEdited should have fired");
}

@test:Config {}
function testReleaseCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleaseCreated"] ?: false, "ReleaseService.onReleaseCreated should have fired");
}

@test:Config {}
function testReleasePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_published");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleasePublished"] ?: false, "ReleaseService.onReleasePublished should have fired");
}

@test:Config {}
function testReleaseReleasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_released");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleaseReleased"] ?: false, "ReleaseService.onReleaseReleased should have fired");
}

@test:Config {}
function testReleasePrereleasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_prereleased");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleasePrereleased"] ?: false, "ReleaseService.onReleasePrereleased should have fired");
}

@test:Config {}
function testReleaseUnpublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_unpublished");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleaseUnpublished"] ?: false, "ReleaseService.onReleaseUnpublished should have fired");
}

@test:Config {}
function testReleaseDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleaseDeleted"] ?: false, "ReleaseService.onReleaseDeleted should have fired");
}

@test:Config {}
function testReleaseEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ReleaseService.onReleaseEdited"] ?: false, "ReleaseService.onReleaseEdited should have fired");
}

@test:Config {}
function testIssueCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueCommentService.onIssueCommentEdited"] ?: false, "IssueCommentService.onIssueCommentEdited should have fired");
}

@test:Config {}
function testIssueCommentPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_pinned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueCommentService.onIssueCommentPinned"] ?: false, "IssueCommentService.onIssueCommentPinned should have fired");
}

@test:Config {}
function testIssueCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueCommentService.onIssueCommentDeleted"] ?: false, "IssueCommentService.onIssueCommentDeleted should have fired");
}

@test:Config {}
function testIssueCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueCommentService.onIssueCommentCreated"] ?: false, "IssueCommentService.onIssueCommentCreated should have fired");
}

@test:Config {}
function testIssueCommentUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueCommentService.onIssueCommentUnpinned"] ?: false, "IssueCommentService.onIssueCommentUnpinned should have fired");
}

@test:Config {}
function testInstallationNewPermissionsAcceptedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_new_permissions_accepted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationService.onInstallationNewPermissionsAccepted"] ?: false, "InstallationService.onInstallationNewPermissionsAccepted should have fired");
}

@test:Config {}
function testInstallationSuspendDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_suspend");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationService.onInstallationSuspend"] ?: false, "InstallationService.onInstallationSuspend should have fired");
}

@test:Config {}
function testInstallationCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationService.onInstallationCreated"] ?: false, "InstallationService.onInstallationCreated should have fired");
}

@test:Config {}
function testInstallationDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationService.onInstallationDeleted"] ?: false, "InstallationService.onInstallationDeleted should have fired");
}

@test:Config {}
function testInstallationUnsuspendDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_unsuspend");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationService.onInstallationUnsuspend"] ?: false, "InstallationService.onInstallationUnsuspend should have fired");
}

@test:Config {}
function testPullRequestReviewCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] ?: false, "PullRequestReviewCommentService.onPullRequestReviewCommentCreated should have fired");
}

@test:Config {}
function testPullRequestReviewCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] ?: false, "PullRequestReviewCommentService.onPullRequestReviewCommentDeleted should have fired");
}

@test:Config {}
function testPullRequestReviewCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] ?: false, "PullRequestReviewCommentService.onPullRequestReviewCommentEdited should have fired");
}

@test:Config {}
function testMetaDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("meta", "meta_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MetaService.onMetaDeleted"] ?: false, "MetaService.onMetaDeleted should have fired");
}

@test:Config {}
function testPublicDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("public", "public");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PublicService.onPublic"] ?: false, "PublicService.onPublic should have fired");
}

@test:Config {}
function testDeploymentStatusCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_status", "deployment_status_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeploymentStatusService.onDeploymentStatusCreated"] ?: false, "DeploymentStatusService.onDeploymentStatusCreated should have fired");
}

@test:Config {}
function testCustomPropertyUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_updated");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CustomPropertyService.onCustomPropertyUpdated"] ?: false, "CustomPropertyService.onCustomPropertyUpdated should have fired");
}

@test:Config {}
function testCustomPropertyDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CustomPropertyService.onCustomPropertyDeleted"] ?: false, "CustomPropertyService.onCustomPropertyDeleted should have fired");
}

@test:Config {}
function testCustomPropertyPromoteToEnterpriseDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_promote_to_enterprise");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CustomPropertyService.onCustomPropertyPromoteToEnterprise"] ?: false, "CustomPropertyService.onCustomPropertyPromoteToEnterprise should have fired");
}

@test:Config {}
function testCustomPropertyCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CustomPropertyService.onCustomPropertyCreated"] ?: false, "CustomPropertyService.onCustomPropertyCreated should have fired");
}

@test:Config {}
function testSecurityAdvisoryWithdrawnDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_withdrawn");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] ?: false, "SecurityAdvisoryService.onSecurityAdvisoryWithdrawn should have fired");
}

@test:Config {}
function testSecurityAdvisoryPublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_published");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecurityAdvisoryService.onSecurityAdvisoryPublished"] ?: false, "SecurityAdvisoryService.onSecurityAdvisoryPublished should have fired");
}

@test:Config {}
function testSecurityAdvisoryUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_updated");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] ?: false, "SecurityAdvisoryService.onSecurityAdvisoryUpdated should have fired");
}

@test:Config {}
function testDiscussionUnansweredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unanswered");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionUnanswered"] ?: false, "DiscussionService.onDiscussionUnanswered should have fired");
}

@test:Config {}
function testDiscussionCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionCreated"] ?: false, "DiscussionService.onDiscussionCreated should have fired");
}

@test:Config {}
function testDiscussionTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_transferred");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionTransferred"] ?: false, "DiscussionService.onDiscussionTransferred should have fired");
}

@test:Config {}
function testDiscussionCategoryChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_category_changed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionCategoryChanged"] ?: false, "DiscussionService.onDiscussionCategoryChanged should have fired");
}

@test:Config {}
function testDiscussionDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionDeleted"] ?: false, "DiscussionService.onDiscussionDeleted should have fired");
}

@test:Config {}
function testDiscussionUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionUnlocked"] ?: false, "DiscussionService.onDiscussionUnlocked should have fired");
}

@test:Config {}
function testDiscussionPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_pinned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionPinned"] ?: false, "DiscussionService.onDiscussionPinned should have fired");
}

@test:Config {}
function testDiscussionEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionEdited"] ?: false, "DiscussionService.onDiscussionEdited should have fired");
}

@test:Config {}
function testDiscussionReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionReopened"] ?: false, "DiscussionService.onDiscussionReopened should have fired");
}

@test:Config {}
function testDiscussionAnsweredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_answered");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionAnswered"] ?: false, "DiscussionService.onDiscussionAnswered should have fired");
}

@test:Config {}
function testDiscussionClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_closed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionClosed"] ?: false, "DiscussionService.onDiscussionClosed should have fired");
}

@test:Config {}
function testDiscussionUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionUnlabeled"] ?: false, "DiscussionService.onDiscussionUnlabeled should have fired");
}

@test:Config {}
function testDiscussionLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_labeled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionLabeled"] ?: false, "DiscussionService.onDiscussionLabeled should have fired");
}

@test:Config {}
function testDiscussionUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionUnpinned"] ?: false, "DiscussionService.onDiscussionUnpinned should have fired");
}

@test:Config {}
function testDiscussionLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_locked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionService.onDiscussionLocked"] ?: false, "DiscussionService.onDiscussionLocked should have fired");
}

@test:Config {}
function testMergeGroupDestroyedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("merge_group", "merge_group_destroyed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MergeGroupService.onMergeGroupDestroyed"] ?: false, "MergeGroupService.onMergeGroupDestroyed should have fired");
}

@test:Config {}
function testMergeGroupChecksRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("merge_group", "merge_group_checks_requested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MergeGroupService.onMergeGroupChecksRequested"] ?: false, "MergeGroupService.onMergeGroupChecksRequested should have fired");
}

@test:Config {}
function testMarketplacePurchasePurchasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_purchased");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MarketplacePurchaseService.onMarketplacePurchasePurchased"] ?: false, "MarketplacePurchaseService.onMarketplacePurchasePurchased should have fired");
}

@test:Config {}
function testMarketplacePurchaseCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] ?: false, "MarketplacePurchaseService.onMarketplacePurchaseCancelled should have fired");
}

@test:Config {}
function testMarketplacePurchasePendingChangeCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_pending_change_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] ?: false, "MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled should have fired");
}

@test:Config {}
function testMarketplacePurchasePendingChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_pending_change");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] ?: false, "MarketplacePurchaseService.onMarketplacePurchasePendingChange should have fired");
}

@test:Config {}
function testMarketplacePurchaseChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_changed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MarketplacePurchaseService.onMarketplacePurchaseChanged"] ?: false, "MarketplacePurchaseService.onMarketplacePurchaseChanged should have fired");
}

@test:Config {}
function testProjectColumnMovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_moved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectColumnService.onProjectColumnMoved"] ?: false, "ProjectColumnService.onProjectColumnMoved should have fired");
}

@test:Config {}
function testProjectColumnEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectColumnService.onProjectColumnEdited"] ?: false, "ProjectColumnService.onProjectColumnEdited should have fired");
}

@test:Config {}
function testProjectColumnDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectColumnService.onProjectColumnDeleted"] ?: false, "ProjectColumnService.onProjectColumnDeleted should have fired");
}

@test:Config {}
function testProjectColumnCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectColumnService.onProjectColumnCreated"] ?: false, "ProjectColumnService.onProjectColumnCreated should have fired");
}

@test:Config {}
function testMembershipAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("membership", "membership_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MembershipService.onMembershipAdded"] ?: false, "MembershipService.onMembershipAdded should have fired");
}

@test:Config {}
function testMembershipRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("membership", "membership_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MembershipService.onMembershipRemoved"] ?: false, "MembershipService.onMembershipRemoved should have fired");
}

@test:Config {}
function testWatchStartedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("watch", "watch_started");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WatchService.onWatchStarted"] ?: false, "WatchService.onWatchStarted should have fired");
}

@test:Config {}
function testLabelEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["LabelService.onLabelEdited"] ?: false, "LabelService.onLabelEdited should have fired");
}

@test:Config {}
function testLabelCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["LabelService.onLabelCreated"] ?: false, "LabelService.onLabelCreated should have fired");
}

@test:Config {}
function testLabelDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["LabelService.onLabelDeleted"] ?: false, "LabelService.onLabelDeleted should have fired");
}

@test:Config {}
function testDeleteDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("delete", "delete");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeleteService.onDelete"] ?: false, "DeleteService.onDelete should have fired");
}

@test:Config {}
function testGithubAppAuthorizationRevokedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("github_app_authorization", "github_app_authorization_revoked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"] ?: false, "GithubAppAuthorizationService.onGithubAppAuthorizationRevoked should have fired");
}

@test:Config {}
function testOrganizationMemberAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrganizationService.onOrganizationMemberAdded"] ?: false, "OrganizationService.onOrganizationMemberAdded should have fired");
}

@test:Config {}
function testOrganizationMemberRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrganizationService.onOrganizationMemberRemoved"] ?: false, "OrganizationService.onOrganizationMemberRemoved should have fired");
}

@test:Config {}
function testOrganizationDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrganizationService.onOrganizationDeleted"] ?: false, "OrganizationService.onOrganizationDeleted should have fired");
}

@test:Config {}
function testOrganizationRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_renamed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrganizationService.onOrganizationRenamed"] ?: false, "OrganizationService.onOrganizationRenamed should have fired");
}

@test:Config {}
function testOrganizationMemberInvitedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_invited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrganizationService.onOrganizationMemberInvited"] ?: false, "OrganizationService.onOrganizationMemberInvited should have fired");
}

@test:Config {}
function testWorkflowJobQueuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_queued");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowJobService.onWorkflowJobQueued"] ?: false, "WorkflowJobService.onWorkflowJobQueued should have fired");
}

@test:Config {}
function testWorkflowJobWaitingDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_waiting");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowJobService.onWorkflowJobWaiting"] ?: false, "WorkflowJobService.onWorkflowJobWaiting should have fired");
}

@test:Config {}
function testWorkflowJobCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_completed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowJobService.onWorkflowJobCompleted"] ?: false, "WorkflowJobService.onWorkflowJobCompleted should have fired");
}

@test:Config {}
function testWorkflowJobInProgressDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_in_progress");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowJobService.onWorkflowJobInProgress"] ?: false, "WorkflowJobService.onWorkflowJobInProgress should have fired");
}

@test:Config {}
function testSecurityAndAnalysisDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_and_analysis", "security_and_analysis");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecurityAndAnalysisService.onSecurityAndAnalysis"] ?: false, "SecurityAndAnalysisService.onSecurityAndAnalysis should have fired");
}

@test:Config {}
function testPullRequestEnqueuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_enqueued");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestEnqueued"] ?: false, "PullRequestService.onPullRequestEnqueued should have fired");
}

@test:Config {}
function testPullRequestReviewRequestRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_review_request_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestReviewRequestRemoved"] ?: false, "PullRequestService.onPullRequestReviewRequestRemoved should have fired");
}

@test:Config {}
function testPullRequestOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_opened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestOpened"] ?: false, "PullRequestService.onPullRequestOpened should have fired");
}

@test:Config {}
function testPullRequestReadyForReviewDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_ready_for_review");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestReadyForReview"] ?: false, "PullRequestService.onPullRequestReadyForReview should have fired");
}

@test:Config {}
function testPullRequestLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_labeled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestLabeled"] ?: false, "PullRequestService.onPullRequestLabeled should have fired");
}

@test:Config {}
function testPullRequestUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestUnassigned"] ?: false, "PullRequestService.onPullRequestUnassigned should have fired");
}

@test:Config {}
function testPullRequestEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestEdited"] ?: false, "PullRequestService.onPullRequestEdited should have fired");
}

@test:Config {}
function testPullRequestSynchronizeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_synchronize");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestSynchronize"] ?: false, "PullRequestService.onPullRequestSynchronize should have fired");
}

@test:Config {}
function testPullRequestReviewRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_review_requested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestReviewRequested"] ?: false, "PullRequestService.onPullRequestReviewRequested should have fired");
}

@test:Config {}
function testPullRequestReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestReopened"] ?: false, "PullRequestService.onPullRequestReopened should have fired");
}

@test:Config {}
function testPullRequestAutoMergeDisabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_auto_merge_disabled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestAutoMergeDisabled"] ?: false, "PullRequestService.onPullRequestAutoMergeDisabled should have fired");
}

@test:Config {}
function testPullRequestLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_locked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestLocked"] ?: false, "PullRequestService.onPullRequestLocked should have fired");
}

@test:Config {}
function testPullRequestAutoMergeEnabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_auto_merge_enabled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestAutoMergeEnabled"] ?: false, "PullRequestService.onPullRequestAutoMergeEnabled should have fired");
}

@test:Config {}
function testPullRequestMilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_milestoned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestMilestoned"] ?: false, "PullRequestService.onPullRequestMilestoned should have fired");
}

@test:Config {}
function testPullRequestDequeuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_dequeued");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestDequeued"] ?: false, "PullRequestService.onPullRequestDequeued should have fired");
}

@test:Config {}
function testPullRequestUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestUnlabeled"] ?: false, "PullRequestService.onPullRequestUnlabeled should have fired");
}

@test:Config {}
function testPullRequestClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_closed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestClosed"] ?: false, "PullRequestService.onPullRequestClosed should have fired");
}

@test:Config {}
function testPullRequestUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestUnlocked"] ?: false, "PullRequestService.onPullRequestUnlocked should have fired");
}

@test:Config {}
function testPullRequestAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_assigned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestAssigned"] ?: false, "PullRequestService.onPullRequestAssigned should have fired");
}

@test:Config {}
function testPullRequestConvertedToDraftDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_converted_to_draft");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestConvertedToDraft"] ?: false, "PullRequestService.onPullRequestConvertedToDraft should have fired");
}

@test:Config {}
function testPullRequestDemilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_demilestoned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestService.onPullRequestDemilestoned"] ?: false, "PullRequestService.onPullRequestDemilestoned should have fired");
}

@test:Config {}
function testProjectsV2StatusUpdateEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] ?: false, "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited should have fired");
}

@test:Config {}
function testProjectsV2StatusUpdateDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] ?: false, "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted should have fired");
}

@test:Config {}
function testProjectsV2StatusUpdateCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] ?: false, "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated should have fired");
}

@test:Config {}
function testGollumDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("gollum", "gollum");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["GollumService.onGollum"] ?: false, "GollumService.onGollum should have fired");
}

@test:Config {}
function testDeploymentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment", "deployment_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeploymentService.onDeploymentCreated"] ?: false, "DeploymentService.onDeploymentCreated should have fired");
}

@test:Config {}
function testPageBuildDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("page_build", "page_build");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PageBuildService.onPageBuild"] ?: false, "PageBuildService.onPageBuild should have fired");
}

@test:Config {}
function testRepositoryImportDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_import", "repository_import");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryImportService.onRepositoryImport"] ?: false, "RepositoryImportService.onRepositoryImport should have fired");
}

@test:Config {}
function testBranchProtectionRuleDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["BranchProtectionRuleService.onBranchProtectionRuleDeleted"] ?: false, "BranchProtectionRuleService.onBranchProtectionRuleDeleted should have fired");
}

@test:Config {}
function testBranchProtectionRuleEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["BranchProtectionRuleService.onBranchProtectionRuleEdited"] ?: false, "BranchProtectionRuleService.onBranchProtectionRuleEdited should have fired");
}

@test:Config {}
function testBranchProtectionRuleCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["BranchProtectionRuleService.onBranchProtectionRuleCreated"] ?: false, "BranchProtectionRuleService.onBranchProtectionRuleCreated should have fired");
}

@test:Config {}
function testDependabotAlertAutoDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_auto_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertAutoDismissed"] ?: false, "DependabotAlertService.onDependabotAlertAutoDismissed should have fired");
}

@test:Config {}
function testDependabotAlertAutoReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_auto_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertAutoReopened"] ?: false, "DependabotAlertService.onDependabotAlertAutoReopened should have fired");
}

@test:Config {}
function testDependabotAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertCreated"] ?: false, "DependabotAlertService.onDependabotAlertCreated should have fired");
}

@test:Config {}
function testDependabotAlertDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertDismissed"] ?: false, "DependabotAlertService.onDependabotAlertDismissed should have fired");
}

@test:Config {}
function testDependabotAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertReopened"] ?: false, "DependabotAlertService.onDependabotAlertReopened should have fired");
}

@test:Config {}
function testDependabotAlertReintroducedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_reintroduced");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertReintroduced"] ?: false, "DependabotAlertService.onDependabotAlertReintroduced should have fired");
}

@test:Config {}
function testDependabotAlertAssigneesChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_assignees_changed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertAssigneesChanged"] ?: false, "DependabotAlertService.onDependabotAlertAssigneesChanged should have fired");
}

@test:Config {}
function testDependabotAlertFixedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_fixed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DependabotAlertService.onDependabotAlertFixed"] ?: false, "DependabotAlertService.onDependabotAlertFixed should have fired");
}

@test:Config {}
function testTeamCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["TeamService.onTeamCreated"] ?: false, "TeamService.onTeamCreated should have fired");
}

@test:Config {}
function testTeamDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["TeamService.onTeamDeleted"] ?: false, "TeamService.onTeamDeleted should have fired");
}

@test:Config {}
function testTeamEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["TeamService.onTeamEdited"] ?: false, "TeamService.onTeamEdited should have fired");
}

@test:Config {}
function testTeamAddedToRepositoryDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_added_to_repository");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["TeamService.onTeamAddedToRepository"] ?: false, "TeamService.onTeamAddedToRepository should have fired");
}

@test:Config {}
function testTeamRemovedFromRepositoryDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_removed_from_repository");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["TeamService.onTeamRemovedFromRepository"] ?: false, "TeamService.onTeamRemovedFromRepository should have fired");
}

@test:Config {}
function testSecretScanningAlertLocationDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert_location", "secret_scanning_alert_location");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningAlertLocationService.onSecretScanningAlertLocation"] ?: false, "SecretScanningAlertLocationService.onSecretScanningAlertLocation should have fired");
}

@test:Config {}
function testWorkflowRunInProgressDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_in_progress");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowRunService.onWorkflowRunInProgress"] ?: false, "WorkflowRunService.onWorkflowRunInProgress should have fired");
}

@test:Config {}
function testWorkflowRunCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_completed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowRunService.onWorkflowRunCompleted"] ?: false, "WorkflowRunService.onWorkflowRunCompleted should have fired");
}

@test:Config {}
function testWorkflowRunRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_requested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowRunService.onWorkflowRunRequested"] ?: false, "WorkflowRunService.onWorkflowRunRequested should have fired");
}

@test:Config {}
function testDeployKeyCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deploy_key", "deploy_key_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeployKeyService.onDeployKeyCreated"] ?: false, "DeployKeyService.onDeployKeyCreated should have fired");
}

@test:Config {}
function testDeployKeyDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deploy_key", "deploy_key_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeployKeyService.onDeployKeyDeleted"] ?: false, "DeployKeyService.onDeployKeyDeleted should have fired");
}

@test:Config {}
function testStarCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star", "star_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["StarService.onStarCreated"] ?: false, "StarService.onStarCreated should have fired");
}

@test:Config {}
function testStarDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star", "star_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["StarService.onStarDeleted"] ?: false, "StarService.onStarDeleted should have fired");
}

@test:Config {}
function testRegistryPackageUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("registry_package", "registry_package_updated");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RegistryPackageService.onRegistryPackageUpdated"] ?: false, "RegistryPackageService.onRegistryPackageUpdated should have fired");
}

@test:Config {}
function testRegistryPackagePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("registry_package", "registry_package_published");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RegistryPackageService.onRegistryPackagePublished"] ?: false, "RegistryPackageService.onRegistryPackagePublished should have fired");
}

@test:Config {}
function testRepositoryRulesetCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryRulesetService.onRepositoryRulesetCreated"] ?: false, "RepositoryRulesetService.onRepositoryRulesetCreated should have fired");
}

@test:Config {}
function testRepositoryRulesetEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryRulesetService.onRepositoryRulesetEdited"] ?: false, "RepositoryRulesetService.onRepositoryRulesetEdited should have fired");
}

@test:Config {}
function testRepositoryRulesetDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryRulesetService.onRepositoryRulesetDeleted"] ?: false, "RepositoryRulesetService.onRepositoryRulesetDeleted should have fired");
}

@test:Config {}
function testOrgBlockBlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("org_block", "org_block_blocked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrgBlockService.onOrgBlockBlocked"] ?: false, "OrgBlockService.onOrgBlockBlocked should have fired");
}

@test:Config {}
function testOrgBlockUnblockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("org_block", "org_block_unblocked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["OrgBlockService.onOrgBlockUnblocked"] ?: false, "OrgBlockService.onOrgBlockUnblocked should have fired");
}

@test:Config {}
function testPullRequestReviewSubmittedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_submitted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewService.onPullRequestReviewSubmitted"] ?: false, "PullRequestReviewService.onPullRequestReviewSubmitted should have fired");
}

@test:Config {}
function testPullRequestReviewEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewService.onPullRequestReviewEdited"] ?: false, "PullRequestReviewService.onPullRequestReviewEdited should have fired");
}

@test:Config {}
function testPullRequestReviewDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewService.onPullRequestReviewDismissed"] ?: false, "PullRequestReviewService.onPullRequestReviewDismissed should have fired");
}

@test:Config {}
function testInstallationRepositoriesRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_repositories", "installation_repositories_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] ?: false, "InstallationRepositoriesService.onInstallationRepositoriesRemoved should have fired");
}

@test:Config {}
function testInstallationRepositoriesAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_repositories", "installation_repositories_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["InstallationRepositoriesService.onInstallationRepositoriesAdded"] ?: false, "InstallationRepositoriesService.onInstallationRepositoriesAdded should have fired");
}

@test:Config {}
function testIssuesReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesReopened"] ?: false, "IssuesService.onIssuesReopened should have fired");
}

@test:Config {}
function testIssuesTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_transferred");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesTransferred"] ?: false, "IssuesService.onIssuesTransferred should have fired");
}

@test:Config {}
function testIssuesUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesUnpinned"] ?: false, "IssuesService.onIssuesUnpinned should have fired");
}

@test:Config {}
function testIssuesAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_assigned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesAssigned"] ?: false, "IssuesService.onIssuesAssigned should have fired");
}

@test:Config {}
function testIssuesMilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_milestoned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesMilestoned"] ?: false, "IssuesService.onIssuesMilestoned should have fired");
}

@test:Config {}
function testIssuesLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_labeled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesLabeled"] ?: false, "IssuesService.onIssuesLabeled should have fired");
}

@test:Config {}
function testIssuesOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_opened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesOpened"] ?: false, "IssuesService.onIssuesOpened should have fired");
}

@test:Config {}
function testIssuesPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_pinned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesPinned"] ?: false, "IssuesService.onIssuesPinned should have fired");
}

@test:Config {}
function testIssuesTypedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_typed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesTyped"] ?: false, "IssuesService.onIssuesTyped should have fired");
}

@test:Config {}
function testIssuesEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesEdited"] ?: false, "IssuesService.onIssuesEdited should have fired");
}

@test:Config {}
function testIssuesUntypedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_untyped");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesUntyped"] ?: false, "IssuesService.onIssuesUntyped should have fired");
}

@test:Config {}
function testIssuesDemilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_demilestoned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesDemilestoned"] ?: false, "IssuesService.onIssuesDemilestoned should have fired");
}

@test:Config {}
function testIssuesLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_locked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesLocked"] ?: false, "IssuesService.onIssuesLocked should have fired");
}

@test:Config {}
function testIssuesUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesUnassigned"] ?: false, "IssuesService.onIssuesUnassigned should have fired");
}

@test:Config {}
function testIssuesUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesUnlocked"] ?: false, "IssuesService.onIssuesUnlocked should have fired");
}

@test:Config {}
function testIssuesUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesUnlabeled"] ?: false, "IssuesService.onIssuesUnlabeled should have fired");
}

@test:Config {}
function testIssuesClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_closed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesClosed"] ?: false, "IssuesService.onIssuesClosed should have fired");
}

@test:Config {}
function testIssuesDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssuesService.onIssuesDeleted"] ?: false, "IssuesService.onIssuesDeleted should have fired");
}

@test:Config {}
function testCheckRunCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckRunService.onCheckRunCreated"] ?: false, "CheckRunService.onCheckRunCreated should have fired");
}

@test:Config {}
function testCheckRunCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_completed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckRunService.onCheckRunCompleted"] ?: false, "CheckRunService.onCheckRunCompleted should have fired");
}

@test:Config {}
function testCheckRunRequestedActionDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_requested_action");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckRunService.onCheckRunRequestedAction"] ?: false, "CheckRunService.onCheckRunRequestedAction should have fired");
}

@test:Config {}
function testCheckRunRerequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_rerequested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CheckRunService.onCheckRunRerequested"] ?: false, "CheckRunService.onCheckRunRerequested should have fired");
}

@test:Config {}
function testDiscussionCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionCommentService.onDiscussionCommentDeleted"] ?: false, "DiscussionCommentService.onDiscussionCommentDeleted should have fired");
}

@test:Config {}
function testDiscussionCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionCommentService.onDiscussionCommentCreated"] ?: false, "DiscussionCommentService.onDiscussionCommentCreated should have fired");
}

@test:Config {}
function testDiscussionCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DiscussionCommentService.onDiscussionCommentEdited"] ?: false, "DiscussionCommentService.onDiscussionCommentEdited should have fired");
}

@test:Config {}
function testCustomPropertyValuesUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property_values", "custom_property_values_updated");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] ?: false, "CustomPropertyValuesService.onCustomPropertyValuesUpdated should have fired");
}

@test:Config {}
function testCommitCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("commit_comment", "commit_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CommitCommentService.onCommitCommentCreated"] ?: false, "CommitCommentService.onCommitCommentCreated should have fired");
}

@test:Config {}
function testForkDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("fork", "fork");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ForkService.onFork"] ?: false, "ForkService.onFork should have fired");
}

@test:Config {}
function testSponsorshipCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SponsorshipService.onSponsorshipCancelled"] ?: false, "SponsorshipService.onSponsorshipCancelled should have fired");
}

@test:Config {}
function testSponsorshipEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SponsorshipService.onSponsorshipEdited"] ?: false, "SponsorshipService.onSponsorshipEdited should have fired");
}

@test:Config {}
function testSponsorshipTierChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_tier_changed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SponsorshipService.onSponsorshipTierChanged"] ?: false, "SponsorshipService.onSponsorshipTierChanged should have fired");
}

@test:Config {}
function testSponsorshipPendingCancellationDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_pending_cancellation");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SponsorshipService.onSponsorshipPendingCancellation"] ?: false, "SponsorshipService.onSponsorshipPendingCancellation should have fired");
}

@test:Config {}
function testSponsorshipCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SponsorshipService.onSponsorshipCreated"] ?: false, "SponsorshipService.onSponsorshipCreated should have fired");
}

@test:Config {}
function testSponsorshipPendingTierChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_pending_tier_change");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SponsorshipService.onSponsorshipPendingTierChange"] ?: false, "SponsorshipService.onSponsorshipPendingTierChange should have fired");
}

@test:Config {}
function testPullRequestReviewThreadUnresolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_thread", "pull_request_review_thread_unresolved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] ?: false, "PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved should have fired");
}

@test:Config {}
function testPullRequestReviewThreadResolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_thread", "pull_request_review_thread_resolved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] ?: false, "PullRequestReviewThreadService.onPullRequestReviewThreadResolved should have fired");
}

@test:Config {}
function testRepositoryDispatchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_dispatch", "repository_dispatch");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryDispatchService.onRepositoryDispatch"] ?: false, "RepositoryDispatchService.onRepositoryDispatch should have fired");
}

@test:Config {}
function testDeploymentProtectionRuleDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_protection_rule", "deployment_protection_rule");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeploymentProtectionRuleService.onDeploymentProtectionRule"] ?: false, "DeploymentProtectionRuleService.onDeploymentProtectionRule should have fired");
}

@test:Config {}
function testCreateDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("create", "create");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["CreateService.onCreate"] ?: false, "CreateService.onCreate should have fired");
}

@test:Config {}
function testWorkflowDispatchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_dispatch", "workflow_dispatch");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["WorkflowDispatchService.onWorkflowDispatch"] ?: false, "WorkflowDispatchService.onWorkflowDispatch should have fired");
}

@test:Config {}
function testBranchProtectionConfigurationEnabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_configuration", "branch_protection_configuration_enabled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"] ?: false, "BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled should have fired");
}

@test:Config {}
function testBranchProtectionConfigurationDisabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_configuration", "branch_protection_configuration_disabled");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"] ?: false, "BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled should have fired");
}

@test:Config {}
function testProjectsV2CreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2Service.onProjectsV2Created"] ?: false, "ProjectsV2Service.onProjectsV2Created should have fired");
}

@test:Config {}
function testProjectsV2EditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2Service.onProjectsV2Edited"] ?: false, "ProjectsV2Service.onProjectsV2Edited should have fired");
}

@test:Config {}
function testProjectsV2ClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_closed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2Service.onProjectsV2Closed"] ?: false, "ProjectsV2Service.onProjectsV2Closed should have fired");
}

@test:Config {}
function testProjectsV2ReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_reopened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2Service.onProjectsV2Reopened"] ?: false, "ProjectsV2Service.onProjectsV2Reopened should have fired");
}

@test:Config {}
function testProjectsV2DeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2Service.onProjectsV2Deleted"] ?: false, "ProjectsV2Service.onProjectsV2Deleted should have fired");
}

@test:Config {}
function testProjectCardEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectCardService.onProjectCardEdited"] ?: false, "ProjectCardService.onProjectCardEdited should have fired");
}

@test:Config {}
function testProjectCardDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectCardService.onProjectCardDeleted"] ?: false, "ProjectCardService.onProjectCardDeleted should have fired");
}

@test:Config {}
function testProjectCardMovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_moved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectCardService.onProjectCardMoved"] ?: false, "ProjectCardService.onProjectCardMoved should have fired");
}

@test:Config {}
function testProjectCardConvertedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_converted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectCardService.onProjectCardConverted"] ?: false, "ProjectCardService.onProjectCardConverted should have fired");
}

@test:Config {}
function testProjectCardCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectCardService.onProjectCardCreated"] ?: false, "ProjectCardService.onProjectCardCreated should have fired");
}

@test:Config {}
function testSubIssuesSubIssueAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_sub_issue_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SubIssuesService.onSubIssuesSubIssueAdded"] ?: false, "SubIssuesService.onSubIssuesSubIssueAdded should have fired");
}

@test:Config {}
function testSubIssuesParentIssueAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_parent_issue_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SubIssuesService.onSubIssuesParentIssueAdded"] ?: false, "SubIssuesService.onSubIssuesParentIssueAdded should have fired");
}

@test:Config {}
function testSubIssuesSubIssueRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_sub_issue_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SubIssuesService.onSubIssuesSubIssueRemoved"] ?: false, "SubIssuesService.onSubIssuesSubIssueRemoved should have fired");
}

@test:Config {}
function testSubIssuesParentIssueRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_parent_issue_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SubIssuesService.onSubIssuesParentIssueRemoved"] ?: false, "SubIssuesService.onSubIssuesParentIssueRemoved should have fired");
}

@test:Config {}
function testPingDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("ping", "ping");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PingService.onPing"] ?: false, "PingService.onPing should have fired");
}

@test:Config {}
function testPackagePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("package", "package_published");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PackageService.onPackagePublished"] ?: false, "PackageService.onPackagePublished should have fired");
}

@test:Config {}
function testPackageUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("package", "package_updated");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["PackageService.onPackageUpdated"] ?: false, "PackageService.onPackageUpdated should have fired");
}

@test:Config {}
function testRepositoryPrivatizedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_privatized");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryPrivatized"] ?: false, "RepositoryService.onRepositoryPrivatized should have fired");
}

@test:Config {}
function testRepositoryCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryCreated"] ?: false, "RepositoryService.onRepositoryCreated should have fired");
}

@test:Config {}
function testRepositoryRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_renamed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryRenamed"] ?: false, "RepositoryService.onRepositoryRenamed should have fired");
}

@test:Config {}
function testRepositoryTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_transferred");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryTransferred"] ?: false, "RepositoryService.onRepositoryTransferred should have fired");
}

@test:Config {}
function testRepositoryEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryEdited"] ?: false, "RepositoryService.onRepositoryEdited should have fired");
}

@test:Config {}
function testRepositoryDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryDeleted"] ?: false, "RepositoryService.onRepositoryDeleted should have fired");
}

@test:Config {}
function testRepositoryArchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_archived");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryArchived"] ?: false, "RepositoryService.onRepositoryArchived should have fired");
}

@test:Config {}
function testRepositoryPublicizedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_publicized");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryPublicized"] ?: false, "RepositoryService.onRepositoryPublicized should have fired");
}

@test:Config {}
function testRepositoryUnarchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_unarchived");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryService.onRepositoryUnarchived"] ?: false, "RepositoryService.onRepositoryUnarchived should have fired");
}

@test:Config {}
function testMemberEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MemberService.onMemberEdited"] ?: false, "MemberService.onMemberEdited should have fired");
}

@test:Config {}
function testMemberAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MemberService.onMemberAdded"] ?: false, "MemberService.onMemberAdded should have fired");
}

@test:Config {}
function testMemberRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MemberService.onMemberRemoved"] ?: false, "MemberService.onMemberRemoved should have fired");
}

@test:Config {}
function testSecretScanningScanDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_scan", "secret_scanning_scan");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["SecretScanningScanService.onSecretScanningScan"] ?: false, "SecretScanningScanService.onSecretScanningScan should have fired");
}

@test:Config {}
function testStatusDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("status", "status");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["StatusService.onStatus"] ?: false, "StatusService.onStatus should have fired");
}

@test:Config {}
function testDeploymentReviewRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_requested");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeploymentReviewService.onDeploymentReviewRequested"] ?: false, "DeploymentReviewService.onDeploymentReviewRequested should have fired");
}

@test:Config {}
function testDeploymentReviewRejectedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_rejected");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeploymentReviewService.onDeploymentReviewRejected"] ?: false, "DeploymentReviewService.onDeploymentReviewRejected should have fired");
}

@test:Config {}
function testDeploymentReviewApprovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_approved");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["DeploymentReviewService.onDeploymentReviewApproved"] ?: false, "DeploymentReviewService.onDeploymentReviewApproved should have fired");
}

@test:Config {}
function testProjectsV2ItemEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemEdited"] ?: false, "ProjectsV2itemService.onProjectsV2ItemEdited should have fired");
}

@test:Config {}
function testProjectsV2ItemCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemCreated"] ?: false, "ProjectsV2itemService.onProjectsV2ItemCreated should have fired");
}

@test:Config {}
function testProjectsV2ItemArchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_archived");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemArchived"] ?: false, "ProjectsV2itemService.onProjectsV2ItemArchived should have fired");
}

@test:Config {}
function testProjectsV2ItemDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemDeleted"] ?: false, "ProjectsV2itemService.onProjectsV2ItemDeleted should have fired");
}

@test:Config {}
function testProjectsV2ItemRestoredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_restored");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemRestored"] ?: false, "ProjectsV2itemService.onProjectsV2ItemRestored should have fired");
}

@test:Config {}
function testProjectsV2ItemReorderedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_reordered");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemReordered"] ?: false, "ProjectsV2itemService.onProjectsV2ItemReordered should have fired");
}

@test:Config {}
function testProjectsV2ItemConvertedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_converted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["ProjectsV2itemService.onProjectsV2ItemConverted"] ?: false, "ProjectsV2itemService.onProjectsV2ItemConverted should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertResolveDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_resolve");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"] ?: false, "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertReopenDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_reopen");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"] ?: false, "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertDismissDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_dismiss");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"] ?: false, "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertCreateDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_create");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"] ?: false, "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate should have fired");
}

@test:Config {}
function testIssueDependenciesBlockingRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocking_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] ?: false, "IssueDependenciesService.onIssueDependenciesBlockingRemoved should have fired");
}

@test:Config {}
function testIssueDependenciesBlockedByRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocked_by_removed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] ?: false, "IssueDependenciesService.onIssueDependenciesBlockedByRemoved should have fired");
}

@test:Config {}
function testIssueDependenciesBlockingAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocking_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueDependenciesService.onIssueDependenciesBlockingAdded"] ?: false, "IssueDependenciesService.onIssueDependenciesBlockingAdded should have fired");
}

@test:Config {}
function testIssueDependenciesBlockedByAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocked_by_added");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] ?: false, "IssueDependenciesService.onIssueDependenciesBlockedByAdded should have fired");
}

@test:Config {}
function testRepositoryAdvisoryReportedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_advisory", "repository_advisory_reported");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] ?: false, "RepositoryAdvisoryService.onRepositoryAdvisoryReported should have fired");
}

@test:Config {}
function testRepositoryAdvisoryPublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_advisory", "repository_advisory_published");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] ?: false, "RepositoryAdvisoryService.onRepositoryAdvisoryPublished should have fired");
}

@test:Config {}
function testTeamAddDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_add", "team_add");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["TeamAddService.onTeamAdd"] ?: false, "TeamAddService.onTeamAdd should have fired");
}

@test:Config {}
function testMilestoneCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_created");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MilestoneService.onMilestoneCreated"] ?: false, "MilestoneService.onMilestoneCreated should have fired");
}

@test:Config {}
function testMilestoneEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_edited");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MilestoneService.onMilestoneEdited"] ?: false, "MilestoneService.onMilestoneEdited should have fired");
}

@test:Config {}
function testMilestoneOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_opened");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MilestoneService.onMilestoneOpened"] ?: false, "MilestoneService.onMilestoneOpened should have fired");
}

@test:Config {}
function testMilestoneDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_deleted");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MilestoneService.onMilestoneDeleted"] ?: false, "MilestoneService.onMilestoneDeleted should have fired");
}

@test:Config {}
function testMilestoneClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_closed");
    test:assertEquals(response.statusCode, http:STATUS_CREATED);
    test:assertTrue(triggerFired["MilestoneService.onMilestoneClosed"] ?: false, "MilestoneService.onMilestoneClosed should have fired");
}

