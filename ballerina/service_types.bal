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

public type DeleteService service object {
    remote function onDelete(DeleteEvent payload) returns error?;
};

public type MetaService service object {
    remote function onMetaDeleted(MetaEvent payload) returns error?;
};

public type WorkflowDispatchService service object {
    remote function onWorkflowDispatch(WorkflowDispatchEvent payload) returns error?;
};

public type SecurityAndAnalysisService service object {
    remote function onSecurityAndAnalysis(SecurityAndAnalysisEvent payload) returns error?;
};

public type DeployKeyService service object {
    remote function onDeployKeyCreated(DeployKeyEvent payload) returns error?;
    remote function onDeployKeyDeleted(DeployKeyEvent payload) returns error?;
};

public type ProjectColumnService service object {
    remote function onProjectColumnMoved(ProjectColumnEvent payload) returns error?;
    remote function onProjectColumnEdited(ProjectColumnEvent payload) returns error?;
    remote function onProjectColumnDeleted(ProjectColumnEvent payload) returns error?;
    remote function onProjectColumnCreated(ProjectColumnEvent payload) returns error?;
};

public type MarketplacePurchaseService service object {
    remote function onMarketplacePurchasePurchased(MarketplacePurchaseEvent payload) returns error?;
    remote function onMarketplacePurchaseCancelled(MarketplacePurchaseEvent payload) returns error?;
    remote function onMarketplacePurchasePendingChangeCancelled(MarketplacePurchaseEvent payload) returns error?;
    remote function onMarketplacePurchasePendingChange(MarketplacePurchaseEvent payload) returns error?;
    remote function onMarketplacePurchaseChanged(MarketplacePurchaseEvent payload) returns error?;
};

public type BranchProtectionConfigurationService service object {
    remote function onBranchProtectionConfigurationEnabled(BranchProtectionConfigurationEvent payload) returns error?;
    remote function onBranchProtectionConfigurationDisabled(BranchProtectionConfigurationEvent payload) returns error?;
};

public type PullRequestService service object {
    remote function onPullRequestEnqueued(PullRequestEvent payload) returns error?;
    remote function onPullRequestReviewRequestRemoved(PullRequestEvent payload) returns error?;
    remote function onPullRequestOpened(PullRequestEvent payload) returns error?;
    remote function onPullRequestReadyForReview(PullRequestEvent payload) returns error?;
    remote function onPullRequestLabeled(PullRequestEvent payload) returns error?;
    remote function onPullRequestUnassigned(PullRequestEvent payload) returns error?;
    remote function onPullRequestEdited(PullRequestEvent payload) returns error?;
    remote function onPullRequestSynchronize(PullRequestEvent payload) returns error?;
    remote function onPullRequestReviewRequested(PullRequestEvent payload) returns error?;
    remote function onPullRequestReopened(PullRequestEvent payload) returns error?;
    remote function onPullRequestAutoMergeDisabled(PullRequestEvent payload) returns error?;
    remote function onPullRequestLocked(PullRequestEvent payload) returns error?;
    remote function onPullRequestAutoMergeEnabled(PullRequestEvent payload) returns error?;
    remote function onPullRequestMilestoned(PullRequestEvent payload) returns error?;
    remote function onPullRequestDequeued(PullRequestEvent payload) returns error?;
    remote function onPullRequestUnlabeled(PullRequestEvent payload) returns error?;
    remote function onPullRequestClosed(PullRequestEvent payload) returns error?;
    remote function onPullRequestUnlocked(PullRequestEvent payload) returns error?;
    remote function onPullRequestAssigned(PullRequestEvent payload) returns error?;
    remote function onPullRequestConvertedToDraft(PullRequestEvent payload) returns error?;
    remote function onPullRequestDemilestoned(PullRequestEvent payload) returns error?;
};

public type LabelService service object {
    remote function onLabelEdited(LabelEvent payload) returns error?;
    remote function onLabelCreated(LabelEvent payload) returns error?;
    remote function onLabelDeleted(LabelEvent payload) returns error?;
};

public type DeploymentService service object {
    remote function onDeploymentCreated(DeploymentEvent payload) returns error?;
};

public type TeamAddService service object {
    remote function onTeamAdd(TeamAddEvent payload) returns error?;
};

public type CodeScanningAlertService service object {
    remote function onCodeScanningAlertAppearedInBranch(CodeScanningAlertEvent payload) returns error?;
    remote function onCodeScanningAlertClosedByUser(CodeScanningAlertEvent payload) returns error?;
    remote function onCodeScanningAlertCreated(CodeScanningAlertEvent payload) returns error?;
    remote function onCodeScanningAlertFixed(CodeScanningAlertEvent payload) returns error?;
    remote function onCodeScanningAlertReopened(CodeScanningAlertEvent payload) returns error?;
    remote function onCodeScanningAlertReopenedByUser(CodeScanningAlertEvent payload) returns error?;
    remote function onCodeScanningAlertUpdatedAssignment(CodeScanningAlertEvent payload) returns error?;
};

public type MembershipService service object {
    remote function onMembershipAdded(MembershipEvent payload) returns error?;
    remote function onMembershipRemoved(MembershipEvent payload) returns error?;
};

public type SecretScanningAlertService service object {
    remote function onSecretScanningAlertAssigned(SecretScanningAlertEvent payload) returns error?;
    remote function onSecretScanningAlertReopened(SecretScanningAlertEvent payload) returns error?;
    remote function onSecretScanningAlertUnassigned(SecretScanningAlertEvent payload) returns error?;
    remote function onSecretScanningAlertCreated(SecretScanningAlertEvent payload) returns error?;
    remote function onSecretScanningAlertPubliclyLeaked(SecretScanningAlertEvent payload) returns error?;
    remote function onSecretScanningAlertValidated(SecretScanningAlertEvent payload) returns error?;
    remote function onSecretScanningAlertResolved(SecretScanningAlertEvent payload) returns error?;
};

public type PushService service object {
    remote function onPush(PushEvent payload) returns error?;
};

public type MemberService service object {
    remote function onMemberEdited(MemberEvent payload) returns error?;
    remote function onMemberAdded(MemberEvent payload) returns error?;
    remote function onMemberRemoved(MemberEvent payload) returns error?;
};

public type RepositoryDispatchService service object {
    remote function onRepositoryDispatch(RepositoryDispatchEvent payload) returns error?;
};

public type StatusService service object {
    remote function onStatus(StatusEvent payload) returns error?;
};

public type RepositoryImportService service object {
    remote function onRepositoryImport(RepositoryImportEvent payload) returns error?;
};

public type PersonalAccessTokenRequestService service object {
    remote function onPersonalAccessTokenRequestCreated(PersonalAccessTokenRequestEvent payload) returns error?;
    remote function onPersonalAccessTokenRequestApproved(PersonalAccessTokenRequestEvent payload) returns error?;
    remote function onPersonalAccessTokenRequestDenied(PersonalAccessTokenRequestEvent payload) returns error?;
    remote function onPersonalAccessTokenRequestCancelled(PersonalAccessTokenRequestEvent payload) returns error?;
};

public type SubIssuesService service object {
    remote function onSubIssuesSubIssueAdded(SubIssuesEvent payload) returns error?;
    remote function onSubIssuesParentIssueAdded(SubIssuesEvent payload) returns error?;
    remote function onSubIssuesSubIssueRemoved(SubIssuesEvent payload) returns error?;
    remote function onSubIssuesParentIssueRemoved(SubIssuesEvent payload) returns error?;
};

public type RepositoryRulesetService service object {
    remote function onRepositoryRulesetCreated(RepositoryRulesetEvent payload) returns error?;
    remote function onRepositoryRulesetEdited(RepositoryRulesetEvent payload) returns error?;
    remote function onRepositoryRulesetDeleted(RepositoryRulesetEvent payload) returns error?;
};

public type MilestoneService service object {
    remote function onMilestoneCreated(MilestoneEvent payload) returns error?;
    remote function onMilestoneEdited(MilestoneEvent payload) returns error?;
    remote function onMilestoneOpened(MilestoneEvent payload) returns error?;
    remote function onMilestoneDeleted(MilestoneEvent payload) returns error?;
    remote function onMilestoneClosed(MilestoneEvent payload) returns error?;
};

public type PublicService service object {
    remote function onPublic(PublicEvent payload) returns error?;
};

public type WorkflowRunService service object {
    remote function onWorkflowRunInProgress(WorkflowRunEvent payload) returns error?;
    remote function onWorkflowRunCompleted(WorkflowRunEvent payload) returns error?;
    remote function onWorkflowRunRequested(WorkflowRunEvent payload) returns error?;
};

public type ProjectsV2statusUpdateService service object {
    remote function onProjectsV2StatusUpdateEdited('ProjectsV2StatusUpdateEvent payload) returns error?;
    remote function onProjectsV2StatusUpdateDeleted('ProjectsV2StatusUpdateEvent payload) returns error?;
    remote function onProjectsV2StatusUpdateCreated('ProjectsV2StatusUpdateEvent payload) returns error?;
};

public type ProjectsV2itemService service object {
    remote function onProjectsV2ItemEdited('ProjectsV2ItemEvent payload) returns error?;
    remote function onProjectsV2ItemCreated('ProjectsV2ItemEvent payload) returns error?;
    remote function onProjectsV2ItemArchived('ProjectsV2ItemEvent payload) returns error?;
    remote function onProjectsV2ItemDeleted('ProjectsV2ItemEvent payload) returns error?;
    remote function onProjectsV2ItemRestored('ProjectsV2ItemEvent payload) returns error?;
    remote function onProjectsV2ItemReordered('ProjectsV2ItemEvent payload) returns error?;
    remote function onProjectsV2ItemConverted('ProjectsV2ItemEvent payload) returns error?;
};

public type SponsorshipService service object {
    remote function onSponsorshipCancelled(SponsorshipEvent payload) returns error?;
    remote function onSponsorshipEdited(SponsorshipEvent payload) returns error?;
    remote function onSponsorshipTierChanged(SponsorshipEvent payload) returns error?;
    remote function onSponsorshipPendingCancellation(SponsorshipEvent payload) returns error?;
    remote function onSponsorshipCreated(SponsorshipEvent payload) returns error?;
    remote function onSponsorshipPendingTierChange(SponsorshipEvent payload) returns error?;
};

public type MergeGroupService service object {
    remote function onMergeGroupDestroyed(MergeGroupEvent payload) returns error?;
    remote function onMergeGroupChecksRequested(MergeGroupEvent payload) returns error?;
};

public type ProjectService service object {
    remote function onProjectDeleted(ProjectEvent payload) returns error?;
    remote function onProjectCreated(ProjectEvent payload) returns error?;
    remote function onProjectClosed(ProjectEvent payload) returns error?;
    remote function onProjectReopened(ProjectEvent payload) returns error?;
    remote function onProjectEdited(ProjectEvent payload) returns error?;
};

public type OrgBlockService service object {
    remote function onOrgBlockBlocked(OrgBlockEvent payload) returns error?;
    remote function onOrgBlockUnblocked(OrgBlockEvent payload) returns error?;
};

public type SecretScanningAlertLocationService service object {
    remote function onSecretScanningAlertLocation(SecretScanningAlertLocationEvent payload) returns error?;
};

public type InstallationTargetService service object {
    remote function onInstallationTargetRenamed(InstallationTargetEvent payload) returns error?;
};

public type CheckSuiteService service object {
    remote function onCheckSuiteCompleted(CheckSuiteEvent payload) returns error?;
    remote function onCheckSuiteRequested(CheckSuiteEvent payload) returns error?;
    remote function onCheckSuiteRerequested(CheckSuiteEvent payload) returns error?;
};

public type PingService service object {
    remote function onPing(PingEvent payload) returns error?;
};

public type IssueCommentService service object {
    remote function onIssueCommentEdited(IssueCommentEvent payload) returns error?;
    remote function onIssueCommentPinned(IssueCommentEvent payload) returns error?;
    remote function onIssueCommentDeleted(IssueCommentEvent payload) returns error?;
    remote function onIssueCommentCreated(IssueCommentEvent payload) returns error?;
    remote function onIssueCommentUnpinned(IssueCommentEvent payload) returns error?;
};

public type SecurityAdvisoryService service object {
    remote function onSecurityAdvisoryWithdrawn(SecurityAdvisoryEvent payload) returns error?;
    remote function onSecurityAdvisoryPublished(SecurityAdvisoryEvent payload) returns error?;
    remote function onSecurityAdvisoryUpdated(SecurityAdvisoryEvent payload) returns error?;
};

public type PackageService service object {
    remote function onPackagePublished(PackageEvent payload) returns error?;
    remote function onPackageUpdated(PackageEvent payload) returns error?;
};

public type DiscussionService service object {
    remote function onDiscussionUnanswered(DiscussionEvent payload) returns error?;
    remote function onDiscussionCreated(DiscussionEvent payload) returns error?;
    remote function onDiscussionTransferred(DiscussionEvent payload) returns error?;
    remote function onDiscussionCategoryChanged(DiscussionEvent payload) returns error?;
    remote function onDiscussionDeleted(DiscussionEvent payload) returns error?;
    remote function onDiscussionUnlocked(DiscussionEvent payload) returns error?;
    remote function onDiscussionPinned(DiscussionEvent payload) returns error?;
    remote function onDiscussionEdited(DiscussionEvent payload) returns error?;
    remote function onDiscussionReopened(DiscussionEvent payload) returns error?;
    remote function onDiscussionAnswered(DiscussionEvent payload) returns error?;
    remote function onDiscussionClosed(DiscussionEvent payload) returns error?;
    remote function onDiscussionUnlabeled(DiscussionEvent payload) returns error?;
    remote function onDiscussionLabeled(DiscussionEvent payload) returns error?;
    remote function onDiscussionUnpinned(DiscussionEvent payload) returns error?;
    remote function onDiscussionLocked(DiscussionEvent payload) returns error?;
};

public type ForkService service object {
    remote function onFork(ForkEvent payload) returns error?;
};

public type PullRequestReviewService service object {
    remote function onPullRequestReviewSubmitted(PullRequestReviewEvent payload) returns error?;
    remote function onPullRequestReviewEdited(PullRequestReviewEvent payload) returns error?;
    remote function onPullRequestReviewDismissed(PullRequestReviewEvent payload) returns error?;
};

public type OrganizationService service object {
    remote function onOrganizationMemberAdded(OrganizationEvent payload) returns error?;
    remote function onOrganizationMemberRemoved(OrganizationEvent payload) returns error?;
    remote function onOrganizationDeleted(OrganizationEvent payload) returns error?;
    remote function onOrganizationRenamed(OrganizationEvent payload) returns error?;
    remote function onOrganizationMemberInvited(OrganizationEvent payload) returns error?;
};

public type IssuesService service object {
    remote function onIssuesReopened(IssuesEvent payload) returns error?;
    remote function onIssuesTransferred(IssuesEvent payload) returns error?;
    remote function onIssuesUnpinned(IssuesEvent payload) returns error?;
    remote function onIssuesAssigned(IssuesEvent payload) returns error?;
    remote function onIssuesMilestoned(IssuesEvent payload) returns error?;
    remote function onIssuesLabeled(IssuesEvent payload) returns error?;
    remote function onIssuesOpened(IssuesEvent payload) returns error?;
    remote function onIssuesPinned(IssuesEvent payload) returns error?;
    remote function onIssuesTyped(IssuesEvent payload) returns error?;
    remote function onIssuesEdited(IssuesEvent payload) returns error?;
    remote function onIssuesUntyped(IssuesEvent payload) returns error?;
    remote function onIssuesDemilestoned(IssuesEvent payload) returns error?;
    remote function onIssuesLocked(IssuesEvent payload) returns error?;
    remote function onIssuesUnassigned(IssuesEvent payload) returns error?;
    remote function onIssuesUnlocked(IssuesEvent payload) returns error?;
    remote function onIssuesUnlabeled(IssuesEvent payload) returns error?;
    remote function onIssuesClosed(IssuesEvent payload) returns error?;
    remote function onIssuesDeleted(IssuesEvent payload) returns error?;
};

public type RegistryPackageService service object {
    remote function onRegistryPackageUpdated(RegistryPackageEvent payload) returns error?;
    remote function onRegistryPackagePublished(RegistryPackageEvent payload) returns error?;
};

public type ProjectsV2Service service object {
    remote function onProjectsV2Created('ProjectsV2Event payload) returns error?;
    remote function onProjectsV2Edited('ProjectsV2Event payload) returns error?;
    remote function onProjectsV2Closed('ProjectsV2Event payload) returns error?;
    remote function onProjectsV2Reopened('ProjectsV2Event payload) returns error?;
    remote function onProjectsV2Deleted('ProjectsV2Event payload) returns error?;
};

public type RepositoryVulnerabilityAlertService service object {
    remote function onRepositoryVulnerabilityAlertResolve(RepositoryVulnerabilityAlertEvent payload) returns error?;
    remote function onRepositoryVulnerabilityAlertReopen(RepositoryVulnerabilityAlertEvent payload) returns error?;
    remote function onRepositoryVulnerabilityAlertDismiss(RepositoryVulnerabilityAlertEvent payload) returns error?;
    remote function onRepositoryVulnerabilityAlertCreate(RepositoryVulnerabilityAlertEvent payload) returns error?;
};

public type StarService service object {
    remote function onStarCreated(StarEvent payload) returns error?;
    remote function onStarDeleted(StarEvent payload) returns error?;
};

public type CreateService service object {
    remote function onCreate(CreateEvent payload) returns error?;
};

public type DeploymentReviewService service object {
    remote function onDeploymentReviewRequested(DeploymentReviewEvent payload) returns error?;
    remote function onDeploymentReviewRejected(DeploymentReviewEvent payload) returns error?;
    remote function onDeploymentReviewApproved(DeploymentReviewEvent payload) returns error?;
};

public type GollumService service object {
    remote function onGollum(GollumEvent payload) returns error?;
};

public type GithubAppAuthorizationService service object {
    remote function onGithubAppAuthorizationRevoked(GithubAppAuthorizationEvent payload) returns error?;
};

public type WatchService service object {
    remote function onWatchStarted(WatchEvent payload) returns error?;
};

public type TeamService service object {
    remote function onTeamCreated(TeamEvent payload) returns error?;
    remote function onTeamDeleted(TeamEvent payload) returns error?;
    remote function onTeamEdited(TeamEvent payload) returns error?;
    remote function onTeamAddedToRepository(TeamEvent payload) returns error?;
    remote function onTeamRemovedFromRepository(TeamEvent payload) returns error?;
};

public type WorkflowJobService service object {
    remote function onWorkflowJobQueued(WorkflowJobEvent payload) returns error?;
    remote function onWorkflowJobWaiting(WorkflowJobEvent payload) returns error?;
    remote function onWorkflowJobCompleted(WorkflowJobEvent payload) returns error?;
    remote function onWorkflowJobInProgress(WorkflowJobEvent payload) returns error?;
};

public type ReleaseService service object {
    remote function onReleaseCreated(ReleaseEvent payload) returns error?;
    remote function onReleasePublished(ReleaseEvent payload) returns error?;
    remote function onReleaseReleased(ReleaseEvent payload) returns error?;
    remote function onReleasePrereleased(ReleaseEvent payload) returns error?;
    remote function onReleaseUnpublished(ReleaseEvent payload) returns error?;
    remote function onReleaseDeleted(ReleaseEvent payload) returns error?;
    remote function onReleaseEdited(ReleaseEvent payload) returns error?;
};

public type InstallationService service object {
    remote function onInstallationNewPermissionsAccepted(InstallationEvent payload) returns error?;
    remote function onInstallationSuspend(InstallationEvent payload) returns error?;
    remote function onInstallationCreated(InstallationEvent payload) returns error?;
    remote function onInstallationDeleted(InstallationEvent payload) returns error?;
    remote function onInstallationUnsuspend(InstallationEvent payload) returns error?;
};

public type CommitCommentService service object {
    remote function onCommitCommentCreated(CommitCommentEvent payload) returns error?;
};

public type DiscussionCommentService service object {
    remote function onDiscussionCommentDeleted(DiscussionCommentEvent payload) returns error?;
    remote function onDiscussionCommentCreated(DiscussionCommentEvent payload) returns error?;
    remote function onDiscussionCommentEdited(DiscussionCommentEvent payload) returns error?;
};

public type BranchProtectionRuleService service object {
    remote function onBranchProtectionRuleDeleted(BranchProtectionRuleEvent payload) returns error?;
    remote function onBranchProtectionRuleEdited(BranchProtectionRuleEvent payload) returns error?;
    remote function onBranchProtectionRuleCreated(BranchProtectionRuleEvent payload) returns error?;
};

public type IssueDependenciesService service object {
    remote function onIssueDependenciesBlockingRemoved(IssueDependenciesEvent payload) returns error?;
    remote function onIssueDependenciesBlockedByRemoved(IssueDependenciesEvent payload) returns error?;
    remote function onIssueDependenciesBlockingAdded(IssueDependenciesEvent payload) returns error?;
    remote function onIssueDependenciesBlockedByAdded(IssueDependenciesEvent payload) returns error?;
};

public type RepositoryService service object {
    remote function onRepositoryPrivatized(RepositoryEvent payload) returns error?;
    remote function onRepositoryCreated(RepositoryEvent payload) returns error?;
    remote function onRepositoryRenamed(RepositoryEvent payload) returns error?;
    remote function onRepositoryTransferred(RepositoryEvent payload) returns error?;
    remote function onRepositoryEdited(RepositoryEvent payload) returns error?;
    remote function onRepositoryDeleted(RepositoryEvent payload) returns error?;
    remote function onRepositoryArchived(RepositoryEvent payload) returns error?;
    remote function onRepositoryPublicized(RepositoryEvent payload) returns error?;
    remote function onRepositoryUnarchived(RepositoryEvent payload) returns error?;
};

public type PullRequestReviewCommentService service object {
    remote function onPullRequestReviewCommentCreated(PullRequestReviewCommentEvent payload) returns error?;
    remote function onPullRequestReviewCommentDeleted(PullRequestReviewCommentEvent payload) returns error?;
    remote function onPullRequestReviewCommentEdited(PullRequestReviewCommentEvent payload) returns error?;
};

public type DeploymentProtectionRuleService service object {
    remote function onDeploymentProtectionRule(DeploymentProtectionRuleEvent payload) returns error?;
};

public type CustomPropertyValuesService service object {
    remote function onCustomPropertyValuesUpdated(CustomPropertyValuesEvent payload) returns error?;
};

public type InstallationRepositoriesService service object {
    remote function onInstallationRepositoriesRemoved(InstallationRepositoriesEvent payload) returns error?;
    remote function onInstallationRepositoriesAdded(InstallationRepositoriesEvent payload) returns error?;
};

public type SecretScanningScanService service object {
    remote function onSecretScanningScan(SecretScanningScanEvent payload) returns error?;
};

public type ProjectCardService service object {
    remote function onProjectCardEdited(ProjectCardEvent payload) returns error?;
    remote function onProjectCardDeleted(ProjectCardEvent payload) returns error?;
    remote function onProjectCardMoved(ProjectCardEvent payload) returns error?;
    remote function onProjectCardConverted(ProjectCardEvent payload) returns error?;
    remote function onProjectCardCreated(ProjectCardEvent payload) returns error?;
};

public type CheckRunService service object {
    remote function onCheckRunCreated(CheckRunEvent payload) returns error?;
    remote function onCheckRunCompleted(CheckRunEvent payload) returns error?;
    remote function onCheckRunRequestedAction(CheckRunEvent payload) returns error?;
    remote function onCheckRunRerequested(CheckRunEvent payload) returns error?;
};

public type PageBuildService service object {
    remote function onPageBuild(PageBuildEvent payload) returns error?;
};

public type CustomPropertyService service object {
    remote function onCustomPropertyUpdated(CustomPropertyEvent payload) returns error?;
    remote function onCustomPropertyDeleted(CustomPropertyEvent payload) returns error?;
    remote function onCustomPropertyPromoteToEnterprise(CustomPropertyEvent payload) returns error?;
    remote function onCustomPropertyCreated(CustomPropertyEvent payload) returns error?;
};

public type DependabotAlertService service object {
    remote function onDependabotAlertAutoDismissed(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertAutoReopened(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertCreated(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertDismissed(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertReopened(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertReintroduced(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertAssigneesChanged(DependabotAlertEvent payload) returns error?;
    remote function onDependabotAlertFixed(DependabotAlertEvent payload) returns error?;
};

public type DeploymentStatusService service object {
    remote function onDeploymentStatusCreated(DeploymentStatusEvent payload) returns error?;
};

public type RepositoryAdvisoryService service object {
    remote function onRepositoryAdvisoryReported(RepositoryAdvisoryEvent payload) returns error?;
    remote function onRepositoryAdvisoryPublished(RepositoryAdvisoryEvent payload) returns error?;
};

public type PullRequestReviewThreadService service object {
    remote function onPullRequestReviewThreadUnresolved(PullRequestReviewThreadEvent payload) returns error?;
    remote function onPullRequestReviewThreadResolved(PullRequestReviewThreadEvent payload) returns error?;
};

public type GenericServiceType DeleteService|MetaService|WorkflowDispatchService|SecurityAndAnalysisService|DeployKeyService|ProjectColumnService|MarketplacePurchaseService|BranchProtectionConfigurationService|PullRequestService|LabelService|DeploymentService|TeamAddService|CodeScanningAlertService|MembershipService|SecretScanningAlertService|PushService|MemberService|RepositoryDispatchService|StatusService|RepositoryImportService|PersonalAccessTokenRequestService|SubIssuesService|RepositoryRulesetService|MilestoneService|PublicService|WorkflowRunService|ProjectsV2statusUpdateService|ProjectsV2itemService|SponsorshipService|MergeGroupService|ProjectService|OrgBlockService|SecretScanningAlertLocationService|InstallationTargetService|CheckSuiteService|PingService|IssueCommentService|SecurityAdvisoryService|PackageService|DiscussionService|ForkService|PullRequestReviewService|OrganizationService|IssuesService|RegistryPackageService|ProjectsV2Service|RepositoryVulnerabilityAlertService|StarService|CreateService|DeploymentReviewService|GollumService|GithubAppAuthorizationService|WatchService|TeamService|WorkflowJobService|ReleaseService|InstallationService|CommitCommentService|DiscussionCommentService|BranchProtectionRuleService|IssueDependenciesService|RepositoryService|PullRequestReviewCommentService|DeploymentProtectionRuleService|CustomPropertyValuesService|InstallationRepositoriesService|SecretScanningScanService|ProjectCardService|CheckRunService|PageBuildService|CustomPropertyService|DependabotAlertService|DeploymentStatusService|RepositoryAdvisoryService|PullRequestReviewThreadService;

