/*
    Author: John Kerski

    Description: Connector wraps many of the "Get" endpoints in the Power BI API (with the exception of ExecuteQuery),
    so that OAuth can be used to authenticate to the service.  This connector serves
    as a way to have a library of Power Query functions to build datasets without the need
    for storing client secrets or passwords in the dataset.  The custom data connector will need
    to be installed in the a Power BI Gateway in order to refresh datasets leveraging this
    custom connector.  For more information on installing a custom data connector with a gateway
    please see: https://learn.microsoft.com/en-us/power-bi/connect-data/service-gateway-custom-connectors .
*/
[Version = "1.2.2"]
section PBIRESTAPIUSGOVDOD;
[
    DataSource.Kind = "PBIRESTAPIUSGOVDOD",
    Publish = "PBIRESTAPIUSGOVDOD.Publish"
]
/*****************
    Navigation Table
*****************/
shared PBIRESTAPIUSGOVDOD.FunctionCatalog = () =>
let
	objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            /* Apps */
            {"GetApp","GetApp",PBIRESTAPIUSGOVDOD.GetApp,"Function","GetApp",true},
            {"GetApps","GetApps",PBIRESTAPIUSGOVDOD.GetApps,"Function","GetApps",true},
            {"GetDashboardInApp","GetDashboardInApp",PBIRESTAPIUSGOVDOD.GetDashboardInApp,"Function","GetDashboardInApp",true},
            {"GetDashboardsInApp","GetDashboardsInApp",PBIRESTAPIUSGOVDOD.GetDashboardsInApp,"Function","GetDashboardsInApp",true},  
            {"GetReportInApp","GetReportInApp",PBIRESTAPIUSGOVDOD.GetReportInApp,"Function","GetReportInApp",true},
            {"GetReportsInApp","GetReportsInApp",PBIRESTAPIUSGOVDOD.GetReportsInApp,"Function","GetReportsInApp",true},                      
            {"GetDashboardTileInApp","GetDashboardTileInApp",PBIRESTAPIUSGOVDOD.GetDashboardTileInApp,"Function","GetDashboardTileInApp",true},                      
            {"GetDashboardTilesInApp","GetDashboardTilesInApp",PBIRESTAPIUSGOVDOD.GetDashboardTilesInApp,"Function","GetDashboardTilesInApp",true},                      
            /* Dashboards */
            {"GetDashboardInGroup","GetDashboardInGroup",PBIRESTAPIUSGOVDOD.GetDashboardInGroup,"Function","GetDashboardInGroup",true},                      
            {"GetDashboardsInGroup","GetDashboardsInGroup",PBIRESTAPIUSGOVDOD.GetDashboardsInGroup,"Function","GetDashboardsInGroup",true},                      
            {"GetDashboardTileInGroup","GetDashboardTileInGroup",PBIRESTAPIUSGOVDOD.GetDashboardTileInGroup,"Function","GetDashboardTileInGroup",true},                      
            {"GetDashboardTilesInGroup","GetDashboardTilesInGroup",PBIRESTAPIUSGOVDOD.GetDashboardTilesInGroup,"Function","GetDashboardTilesInGroup",true},                      
            /* Dataflows */
            {"GetDataflowInGroup","GetDataflowInGroup",PBIRESTAPIUSGOVDOD.GetDataflowInGroup,"Function","GetDataflowInGroup",true},            
            {"GetDataflowDataSourcesInGroup","GetDataflowDataSourcesInGroup",PBIRESTAPIUSGOVDOD.GetDataflowDataSourcesInGroup,"Function","GetDataflowDataSourcesInGroup",true},            
            {"GetDataflowTransactionsInGroup","GetDataflowTransactionsInGroup",PBIRESTAPIUSGOVDOD.GetDataflowTransactionsInGroup,"Function","GetDataflowTransactionsInGroup",true},            
            {"GetDataflowsInGroup","GetDataflowsInGroup",PBIRESTAPIUSGOVDOD.GetDataflowsInGroup,"Function","GetDataflowsInGroup",true},            
            {"GetUpstreamDataflowsInGroup","GetUpstreamDataflowsInGroup",PBIRESTAPIUSGOVDOD.GetUpstreamDataflowsInGroup,"Function","GetUpstreamDataflowsInGroup",true},                                    
            /* Datasets */
            {"GetDatasetDiscoverGatewaysInGroup","GetDatasetDiscoverGatewaysInGroup",PBIRESTAPIUSGOVDOD.GetDatasetDiscoverGatewaysInGroup,"Function","GetDatasetDiscoverGatewaysInGroup",true},            
            {"GetDatasetInGroup","GetDatasetInGroup",PBIRESTAPIUSGOVDOD.GetDatasetInGroup,"Function","GetDatasetInGroup",true},
            {"GetDatasetToDataflowsLinksInGroup","GetDatasetToDataflowsLinksInGroup",PBIRESTAPIUSGOVDOD.GetDatasetToDataflowsLinksInGroup,"Function","GetDatasetToDataflowsLinksInGroup",true},
            {"GetDatasetUsersInGroup","GetDatasetUsersInGroup",PBIRESTAPIUSGOVDOD.GetDatasetUsersInGroup,"Function","GetDatasetUsersInGroup",true},
            {"GetDatasetsInGroup","GetDatasetsInGroup",PBIRESTAPIUSGOVDOD.GetDatasetsInGroup,"Function","GetDatasetsInGroup",true},
            {"GetDatasetDatasourcesInGroup","GetDatasetDatasourcesInGroup",PBIRESTAPIUSGOVDOD.GetDatasetDatasourcesInGroup,"Function","GetDatasetDatasourcesInGroup",true},
            {"GetDatasetDirectQueryRefreshScheduleInGroup","GetDatasetDirectQueryRefreshScheduleInGroup",PBIRESTAPIUSGOVDOD.GetDatasetDirectQueryRefreshScheduleInGroup,"Function","GetDatasetDirectQueryRefreshScheduleInGroup",true},
            {"GetDatasetParametersInGroup","GetDatasetParametersInGroup",PBIRESTAPIUSGOVDOD.GetDatasetParametersInGroup,"Function","GetDatasetParametersInGroup",true},
            {"GetDatasetQueryScaleOutStatusInGroup","GetDatasetQueryScaleOutStatusInGroup",PBIRESTAPIUSGOVDOD.GetDatasetQueryScaleOutStatusInGroup,"Function","GetDatasetQueryScaleOutStatusInGroup",true},
            {"GetDatasetRefreshExecutionDetailsInGroup","GetDatasetRefreshExecutionDetailsInGroup",PBIRESTAPIUSGOVDOD.GetDatasetRefreshExecutionDetailsInGroup,"Function","GetDatasetRefreshExecutionDetailsInGroup",true},
            {"GetDatasetRefreshHistoryInGroup","GetDatasetRefreshHistoryInGroup",PBIRESTAPIUSGOVDOD.GetDatasetRefreshHistoryInGroup,"Function","GetDatasetRefreshHistoryInGroup",true},
            {"GetDatasetRefreshScheduleInGroup","GetDatasetRefreshScheduleInGroup",PBIRESTAPIUSGOVDOD.GetDatasetRefreshScheduleInGroup,"Function","GetDatasetRefreshScheduleInGroup",true},
            {"ExecuteQuery","ExecuteQuery",PBIRESTAPIUSGOVDOD.ExecuteQuery,"Function","ExecuteQuery",true},
            {"ExecuteQueryInGroup","ExecuteQueryInGroup",PBIRESTAPIUSGOVDOD.ExecuteQueryInGroup,"Function","ExecuteQueryInGroup",true},
            /* Reports */
            {"GetPaginatedReportDatasourcesInGroup","GetPaginatedReportDatasourcesInGroup",PBIRESTAPIUSGOVDOD.GetPaginatedReportDatasourcesInGroup,"Function","GetPaginatedReportDatasourcesInGroup",true},
            {"GetReportPageInGroup","GetReportPageInGroup",PBIRESTAPIUSGOVDOD.GetReportPageInGroup,"Function","GetReportPageInGroup",true},
            {"GetReportPagesInGroup","GetReportPagesInGroup",PBIRESTAPIUSGOVDOD.GetReportPagesInGroup,"Function","GetReportPagesInGroup",true},
            {"GetReportInGroup","GetReportInGroup",PBIRESTAPIUSGOVDOD.GetReportInGroup,"Function","GetReportInGroup",true},
            {"GetReportsInGroup","GetReportsInGroup",PBIRESTAPIUSGOVDOD.GetReportsInGroup,"Function","GetReportsInGroup",true},
            /* Goal Values */            
            {"GetScorecardGoalValuesInGroup","GetScorecardGoalValuesInGroup",PBIRESTAPIUSGOVDOD.GetScorecardGoalValuesInGroup,"Function","GetScorecardGoalValuesInGroup",true},
            {"GetScorecardGoalValueInGroup","GetScorecardGoalValueInGroup",PBIRESTAPIUSGOVDOD.GetScorecardGoalValueInGroup,"Function","GetScorecardGoalValueInGroup",true},            
            /* Goals */
            {"GetScorecardGoalsInGroup","GetScorecardGoalsInGroup",PBIRESTAPIUSGOVDOD.GetScorecardGoalsInGroup,"Function","GetScorecardGoalsInGroup",true},            
            {"GetScorecardGoalInGroup","GetScorecardGoalInGroup",PBIRESTAPIUSGOVDOD.GetScorecardGoalInGroup,"Function","GetScorecardGoalInGroup",true},            
            {"GetScorecardGoalRefreshHistoryInGroup","GetScorecardGoalRefreshHistoryInGroup",PBIRESTAPIUSGOVDOD.GetScorecardGoalRefreshHistoryInGroup,"Function","GetScorecardGoalRefreshHistoryInGroup",true},            
            /* GoalsStatusRules */
            {"GetScorecardGoalsStatusRulesInGroup","GetScorecardGoalsStatusRulesInGroup",PBIRESTAPIUSGOVDOD.GetScorecardGoalsStatusRulesInGroup,"Function","GetScorecardGoalsStatusRulesInGroup",true},
            /* Groups */
            {"GetGroupUsers","GetGroupUsers",PBIRESTAPIUSGOVDOD.GetGroupUsers,"Function","GetGroupUsers",true},
            {"GetGroups","GetGroups",PBIRESTAPIUSGOVDOD.GetGroups,"Function","GetGroups",true},
            /* Pipelines */
            {"GetPipeline","GetPipeline",PBIRESTAPIUSGOVDOD.GetPipeline,"Function","GetPipeline",true}, 
            {"GetPipelineOperation","GetPipelineOperation",PBIRESTAPIUSGOVDOD.GetPipelineOperation,"Function","GetPipelineOperation",true},
            {"GetPipelineOperations","GetPipelineOperations",PBIRESTAPIUSGOVDOD.GetPipelineOperations,"Function","GetPipelineOperations",true},
            {"GetPipelineStageArtifacts","GetPipelineStageArtifacts",PBIRESTAPIUSGOVDOD.GetPipelineStageArtifacts,"Function","GetPipelineStageArtifacts",true},
            {"GetPipelineStages","GetPipelineStages",PBIRESTAPIUSGOVDOD.GetPipelineStages,"Function","GetPipelineStages",true},
            {"GetPipelineUsers","GetPipelineUsers",PBIRESTAPIUSGOVDOD.GetPipelineUsers,"Function","GetPipelineUsers",true},
            {"GetPipelines","GetPipelines",PBIRESTAPIUSGOVDOD.GetPipelines,"Function","GetPipelines",true},
            /* Scorecards */
            {"GetScorecardsInGroup","GetScorecardsInGroup",PBIRESTAPIUSGOVDOD.GetScorecardsInGroup,"Function","GetScorecardsInGroup",true},
            {"GetScorecardInGroup","GetScorecardInGroup",PBIRESTAPIUSGOVDOD.GetScorecardInGroup,"Function","GetScorecardInGroup",true},                                     
            {"GetScorecardByReportIdInGroup","GetScorecardByReportIdInGroup",PBIRESTAPIUSGOVDOD.GetScorecardByReportIdInGroup,"Function","GetScorecardByReportIdInGroup",true}                                           
        }),
	navTable = Table.ForceToNavigationTable(objects, {"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
	navTable;

/*****************
    APPS
*****************/

/*** GetApp ***/
shared PBIRESTAPIUSGOVDOD.GetApp = Value.ReplaceType(
    GetApp,
    GetAppType
);

GetAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "App ID",
            Documentation.FieldDescription = "The Application ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetApp",
    Documentation.LongDescription = "Returns the specified installed app.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetApp(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-app#app"
        ]
    }
];

GetApp = (optional appId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId)
    in
        result;
/*** End GetApp ***/
/*** GetApps***/
shared PBIRESTAPIUSGOVDOD.GetApps = Value.ReplaceType(
    GetApps,
    GetAppsType
);

GetAppsType = type function (
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetApps",
    Documentation.LongDescription = "Returns a list of installed apps.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetApps()",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-apps#apps"
        ]
    }
];

GetApps = () =>
    let
        result = GetJSON("v1.0/myorg/apps")
    in
        result;
/*** End GetApps***/

/*** GetDashboardInApp***/
shared PBIRESTAPIUSGOVDOD.GetDashboardInApp = Value.ReplaceType(
    GetDashboardInApp,
    GetDashboardInAppType
);

GetDashboardInAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "App ID",
            Documentation.FieldDescription = "The Application ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional dashboardId as (
        type text meta [
            Documentation.FieldCaption = "Dashboard ID",
            Documentation.FieldDescription = "The Dashboard ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardInApp",
    Documentation.LongDescription = "Returns the specified dashboard from the specified app.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardInApp(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-dashboard#dashboard"
        ]
    }
];

GetDashboardInApp = (optional appId as text, optional dashboardId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId & "/dashboards/" & dashboardId)
    in
        result;

/*** End GetDashboardInApp***/

/*** GetDashboardsInApp***/
shared PBIRESTAPIUSGOVDOD.GetDashboardsInApp = Value.ReplaceType(
    GetDashboardsInApp,
    GetDashboardsInAppType
);

GetDashboardsInAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "App ID",
            Documentation.FieldDescription = "The Application ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardsInApp",
    Documentation.LongDescription = "Returns a list of dashboards from the specified app.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardsInApp(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-dashboards#dashboards"
        ]
    }
];

GetDashboardsInApp = (optional appId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId & "/dashboards")
    in
        result;

/*** End GetDashboardsInApp***/

/*** GetReportInApp***/
shared PBIRESTAPIUSGOVDOD.GetReportInApp = Value.ReplaceType(
    GetReportInApp,
    GetReportInAppType
);

GetReportInAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "App ID",
            Documentation.FieldDescription = "The Application ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional reportId as (
        type text meta [
            Documentation.FieldCaption = "Report ID",
            Documentation.FieldDescription = "The Report ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetReportInApp",
    Documentation.LongDescription = "Returns the specified report from the specified app.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetReportInApp(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-report#report"
        ]
    }
];

GetReportInApp = (optional appId as text, optional reportId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId & "/reports/" & reportId)
    in
        result;

/*** End GetReportInApp***/

/*** GetReports***/
shared PBIRESTAPIUSGOVDOD.GetReportsInApp = Value.ReplaceType(
    GetReportsInApp,
    GetReportsInAppType
);

GetReportsInAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "Application ID",
            Documentation.FieldDescription = "The Application ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetReportsInApp",
    Documentation.LongDescription = "Returns a list of reports from the specified app.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetReportsInApp(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-reports#reports"
        ]
    }
];

GetReportsInApp = (optional appId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId & "/reports")
    in
        result;

/*** End GetReports***/

/*** GetDashboardTileInApp***/
shared PBIRESTAPIUSGOVDOD.GetDashboardTileInApp = Value.ReplaceType(
    GetDashboardTileInApp,
    GetDashboardTileInAppType
);

GetDashboardTileInAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "App ID",
            Documentation.FieldDescription = "The application ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional dashboardId as (
        type text meta [
            Documentation.FieldCaption = "Dashboard ID",
            Documentation.FieldDescription = "The dashboard ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional tileId as (
        type text meta [
            Documentation.FieldCaption = "Tile ID",
            Documentation.FieldDescription = "The tile ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardTileInApp",
    Documentation.LongDescription = "Returns the specified tile within the specified dashboard from the specified app.
                                     Supported tiles include datasets and live tiles that contain an entire report page.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardTileInApp(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-tile#tile"
        ]
    }
];

GetDashboardTileInApp = (optional appId as text, optional dashboardId as text, optional tileId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId & "/dashboards/" & dashboardId & "/tiles/" & tileId)
    in
        result;
/*** End GetDashboardTileApp***/

/*** GetDashboardTilesInApp***/
shared PBIRESTAPIUSGOVDOD.GetDashboardTilesInApp = Value.ReplaceType(
    GetDashboardTilesInApp,
    GetDashboardTilesInAppType
);

GetDashboardTilesInAppType = type function (
    optional appId as (
        type text meta [
            Documentation.FieldCaption = "App ID",
            Documentation.FieldDescription = "The application ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional dashboardId as (
        type text meta [
            Documentation.FieldCaption = "Dashboard ID",
            Documentation.FieldDescription = "The dashboard ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ) 
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardTilesInApp",
    Documentation.LongDescription = "Returns a list of tiles within the specified dashboard from the specified app.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardTilesInApp(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/apps/get-tiles#tiles"
        ]
    }
];

GetDashboardTilesInApp = (optional appId as text, optional dashboardId as text) =>
    let
        result = GetJSON("v1.0/myorg/apps/" & appId & "/dashboards/" & dashboardId & "/tiles")
    in
        result;
/*** End GetDashboardTilesInApp***/

/*****************
    Dashboards
*****************/

/*** GetDashboardInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDashboardInGroup = Value.ReplaceType(
    GetDashboardInGroup,
    GetDashboardInGroupType
);

GetDashboardInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional dashboardId as (
        type text meta [
            Documentation.FieldCaption = "Dashboard ID",
            Documentation.FieldDescription = "The dashboard ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardInGroup",
    Documentation.LongDescription = "Returns the specified dashboard from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dashboards/get-dashboard-in-group#dashboard"
        ]
    }
];

GetDashboardInGroup = (optional groupId as text, optional dashboardId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/dashboards/" & dashboardId)
    in
        result;
/*** End GetDashboardInGroup***/

/*** GetDashboardsInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDashboardsInGroup = Value.ReplaceType(
    GetDashboardsInGroup,
    GetDashboardsInGroupType
);

GetDashboardsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardsInGroup",
    Documentation.LongDescription = "Returns a list of dashboards from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardsInGroup(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dashboards/get-dashboards-in-group#dashboards"
        ]
    }
];

GetDashboardsInGroup = (optional groupdId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/dashboards")
    in
        result;
/*** End GetDashboardsInGroup***/

/*** GetDashboardTileInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDashboardTileInGroup = Value.ReplaceType(
    GetDashboardTileInGroup,
    GetDashboardTileInGroupType
);

GetDashboardTileInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional dashboardId as (
        type text meta [
            Documentation.FieldCaption = "Dashboard ID",
            Documentation.FieldDescription = "The dashboard ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional tileId as (
        type text meta [
            Documentation.FieldCaption = "Tile ID",
            Documentation.FieldDescription = "The tile ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardTileInGroup",
    Documentation.LongDescription = "Returns the specified tile within the specified dashboard from the specified workspace.
                                     Supported tiles include datasets and live tiles that contain an entire report page.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardTileInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dashboards/get-tile-in-group#tile"
        ]
    }
];
GetDashboardTileInGroup = (optional groupId as text, optional dashboardId as text, optional tileId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/dashboards/" & dashboardId & "/tiles/" & tileId)
    in
        result;
/*** End GetDashboardTileInGroup***/

/*** GetDashboardTilesInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDashboardTilesInGroup = Value.ReplaceType(
    GetDashboardTilesInGroup,
    GetDashboardTilesInGroupType
);

GetDashboardTilesInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional dashboardId as (
        type text meta [
            Documentation.FieldCaption = "Dashboard ID",
            Documentation.FieldDescription = "The dashboard ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ) 
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDashboardTilesInGroup",
    Documentation.LongDescription = "Returns a list of tiles within the specified dashboard from the specified workspace.
                                     Supported tiles include datasets and live tiles that contain an entire report page.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDashboardTilesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dashboards/get-tiles-in-group#tiles"
        ]
    }
];

GetDashboardTilesInGroup = (optional groupId as text, optional dashboardId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/dashboards/" & dashboardId & "/tiles")
    in
        result;
/*** End GetDashboardTilesInGroup***/


/*****************
    Dataflows
*****************/

/*** GetDataflowInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDataflowInGroup = Value.ReplaceType(
    GetDataflowInGroup,
    GetDataflowInGroupType
);

GetDataflowInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataflow ID",
            Documentation.FieldDescription = "The dataflow ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDataflowInGroup",
    Documentation.LongDescription = "Exports the specified dataflow definition to a JSON file.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDataflowInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Exported Json file"
        ]
    }
];

GetDataflowInGroup = (optional groupdId as text, optional dataflowId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/dataflows/" & dataflowId)
    in
        result;
/*** End GetDataflowInGroup***/

/*** GetDataflowDataSourcesInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDataflowDataSourcesInGroup = Value.ReplaceType(
    GetDataflowDataSourcesInGroup,
    GetDataflowDataSourcesInGroupType
);

GetDataflowDataSourcesInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataflow ID",
            Documentation.FieldDescription = "The dataflow ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDataflowDataSourcesInGroup",
    Documentation.LongDescription = "Returns a list of data sources for the specified dataflow.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDataflowDataSourcesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dataflows/get-dataflow-data-sources#datasources"
        ]
    }
];

GetDataflowDataSourcesInGroup = (optional groupdId as text, optional dataflowId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/dataflows/" & dataflowId & "/datasources")
    in
        result;
/*** End GetDataflowDataSourcesInGroup***/

/*** GetDataflowTransactionsInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDataflowTransactionsInGroup = Value.ReplaceType(
    GetDataflowTransactionsInGroup,
    GetDataflowTransactionsInGroupType
);

GetDataflowTransactionsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataflow ID",
            Documentation.FieldDescription = "The dataflow ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDataflowTransactionsInGroup",
    Documentation.LongDescription = "Returns a list of transactions for the specified dataflow.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDataflowTransactionsInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dataflows/get-dataflow-transactions#dataflowtransactions"
        ]
    }
];

GetDataflowTransactionsInGroup = (optional groupdId as text, optional dataflowId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/dataflows/" & dataflowId & "/transactions")
    in
        result;
/*** End GetDataflowTransactionsInGroup***/

/*** GetDataflowsInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDataflowsInGroup = Value.ReplaceType(
    GetDataflowsInGroup,
    GetDataflowsInGroupType
);

GetDataflowsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDataflowsInGroup",
    Documentation.LongDescription = "Returns a list of all dataflows from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDataflowsInGroup(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dataflows/get-dataflows#dataflows"
        ]
    }
];

GetDataflowsInGroup = (optional groupdId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/dataflows")
    in
        result;
/*** End GetDataflowsInGroup***/

/** GetUpstreamDataflowsInGroup***/
shared PBIRESTAPIUSGOVDOD.GetUpstreamDataflowsInGroup = Value.ReplaceType(
    GetUpstreamDataflowsInGroup,
    GetUpstreamDataflowsInGroupType
);

GetUpstreamDataflowsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataflow ID",
            Documentation.FieldDescription = "The dataflow ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetUpstreamDataflowsInGroup",
    Documentation.LongDescription = "Returns a list of upstream dataflows for the specified dataflow.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetUpstreamDataflowsInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/dataflows/get-upstream-dataflows-in-group#dependentdataflows"
        ]
    }
];

GetUpstreamDataflowsInGroup = (optional groupdId as text, optional dataflowId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/dataflows/" & dataflowId & "/upstreamDataflows")
    in
        result;
/** End GetUpstreamDataflowsInGroup***/




/*****************
    Datasets
*****************/

/*** GetDatasetDiscoverGatewaysInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetDiscoverGatewaysInGroup = Value.ReplaceType(
    GetDatasetDiscoverGatewaysInGroup,
    GetDatasetDiscoverGatewaysInGroupType
);

GetDatasetDiscoverGatewaysInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetDiscoverGatewaysInGroup",
    Documentation.LongDescription = "Returns a list of gateways that the specified dataset from the specified workspace can be bound to. This API call is only relevant to datasets that have at least one on-premises connection. For datasets with cloud-only connections, this API call returns an empty list.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetDiscoverGatewaysInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/discover-gateways-in-group#gateways"
        ]
    }
];

GetDatasetDiscoverGatewaysInGroup = (optional groupdId as text, optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId & "/Default.DiscoverGateways")
    in
        result;
/*** End GetDatasetDiscoverGatewaysInGroup***/

/*** GetDatasetInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetInGroup = Value.ReplaceType(
    GetDatasetInGroup,
    GetDatasetInGroupType
);

GetDatasetInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetInGroup",
    Documentation.LongDescription = "Returns the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-datasets-in-group#datasets"
        ]
    }
];

GetDatasetInGroup = (optional groupdId as text, optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId)
    in
        result;
/*** End GetDatasetInGroup***/

/*** GetDatasetToDataflowsLinksInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetToDataflowsLinksInGroup = Value.ReplaceType(
    GetDatasetToDataflowsLinksInGroup,
    GetDatasetToDataflowsLinksInGroupType
);

GetDatasetToDataflowsLinksInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetToDataflowsLinksInGroup",
    Documentation.LongDescription = "Returns a list of upstream dataflows for datasets from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetToDataflowsLinksInGroup(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-dataset-to-dataflows-links-in-group#datasettodataflowlinksresponse"
        ]
    }
];

GetDatasetToDataflowsLinksInGroup = (optional groupdId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/upstreamDataflows")
    in
        result;
/*** End GetDatasetToDataflowsLinksInGroup***/

/*** GetDatasetsUsersInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetUsersInGroup = Value.ReplaceType(
    GetDatasetUsersInGroup,
    GetDatasetUsersInGroupType
);

GetDatasetUsersInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetUsersInGroup",
    Documentation.LongDescription = "Returns a list of principals that have access to the specified dataset. When user permissions to a dataset have been recently updated, the new permissions might not be immediately available through API calls.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetUsersInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-dataset-users-in-group#datasetusersaccess"
        ]
    }
];

GetDatasetUsersInGroup = (optional groupdId as text, optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId & "/users")
    in
        result;
/*** End GetDatasetUsersInGroup***/

/*** GetDatasetsInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetsInGroup = Value.ReplaceType(
    GetDatasetsInGroup,
    GetDatasetsInGroupType
);

GetDatasetsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetsInGroup",
    Documentation.LongDescription = "Returns a list of datasets from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetsInGroup(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-datasets-in-group#datasets"
        ]
    }
];

GetDatasetsInGroup = (optional groupdId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets")
    in
        result;
/*** End GetDatasetsInGroup***/

/*** GetDatasetDatasourcesInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetDatasourcesInGroup = Value.ReplaceType(
    GetDatasetDatasourcesInGroup,
    GetDatasetDatasourcesInGroupType
);

GetDatasetDatasourcesInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetDatasourcesInGroup",
    Documentation.LongDescription = "Returns a list of data sources for the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetDatasourcesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-datasources-in-group#datasources"
        ]
    }
];

GetDatasetDatasourcesInGroup = (optional groupdId as text, optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId & "/datasources")
    in
        result;
/*** End GetDatasetDatasourcesInGroup***/

/*** GetDatasetDirectQueryRefreshScheduleInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetDirectQueryRefreshScheduleInGroup = Value.ReplaceType(
    GetDatasetDirectQueryRefreshScheduleInGroup,
    GetDatasetDirectQueryRefreshScheduleInGroupType
);

GetDatasetDirectQueryRefreshScheduleInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetDirectQueryRefreshScheduleInGroup",
    Documentation.LongDescription = "Returns the refresh schedule for a specified DirectQuery or LiveConnection dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetDirectQueryRefreshScheduleInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-direct-query-refresh-schedule-in-group#directqueryrefreshschedule"
        ]
    }
];

GetDatasetDirectQueryRefreshScheduleInGroup = (optional groupdId as text, optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId & "/directQueryRefreshSchedule")
    in
        result;
/*** End GetDatasetDirectQueryRefreshScheduleInGroup***/

/*** GetDatasetGatewayDatasourcesInGroup***/
// Deprecated
/*** End GetDatasetGatewayDatasourcesInGroup***/

/*** GetDatasetParametersInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetParametersInGroup = Value.ReplaceType(
    GetDatasetParametersInGroup,
    GetDatasetParametersInGroupType
);

GetDatasetParametersInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetParametersInGroup",
    Documentation.LongDescription = "Returns a list of parameters for the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetParametersInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-parameters-in-group#mashupparameters"
        ]
    }
];

GetDatasetParametersInGroup = (optional groupdId as text, optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId & "/parameters")
    in
        result;
/*** End GetDatasetParametersInGroup***/

/*** GetDatasetRefreshExecutionDetailsInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetRefreshExecutionDetailsInGroup = Value.ReplaceType(
    GetDatasetRefreshExecutionDetailsInGroup,
    GetDatasetRefreshExecutionDetailsInGroupType
);

GetDatasetRefreshExecutionDetailsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional refreshId as (
        type text meta [
            Documentation.FieldCaption = "Refresh ID",
            Documentation.FieldDescription = "The Refresh ID",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    )        
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetRefreshExecutionDetailsInGroup",
    Documentation.LongDescription = "Returns execution details of an enhanced refresh operation for the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetRefreshExecutionDetailsInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-refresh-execution-details-in-group#datasetrefreshdetail"
        ]
    }
];

GetDatasetRefreshExecutionDetailsInGroup = (optional groupdId as text, optional datasetId as text, optional refreshId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/datasets/" & datasetId & "/refreshes/" & refreshId)
    in
        result;
/*** End GetDatasetRefreshExecutionDetailsInGroup***/

/*** GetDatasetRefreshHistoryInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetRefreshHistoryInGroup = Value.ReplaceType(
    GetDatasetRefreshHistoryInGroup,
    GetDatasetRefreshHistoryInGroupType
);

GetDatasetRefreshHistoryInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetRefreshHistoryInGroup",
    Documentation.LongDescription = "Returns the refresh history for the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetRefreshHistoryInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-refresh-history-in-group#refreshes"
        ]
    }
];

GetDatasetRefreshHistoryInGroup = (optional groupId as text , optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/datasets/" & datasetId & "/refreshes")
    in
        result;
/*** End GetDatasetRefreshHistoryInGroup***/

/*** GetDatasetRefreshScheduleInGroup***/
shared PBIRESTAPIUSGOVDOD.GetDatasetRefreshScheduleInGroup = Value.ReplaceType(
    GetDatasetRefreshScheduleInGroup,
    GetDatasetRefreshScheduleInGroupType
);

GetDatasetRefreshScheduleInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetRefreshScheduleInGroup",
    Documentation.LongDescription = "Returns the refresh schedule for the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetRefreshScheduleInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-refresh-schedule-in-group#refreshschedule"
        ]
    }
];

GetDatasetRefreshScheduleInGroup = (optional groupId as text , optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/datasets/" & datasetId & "/refreshSchedule")
    in
        result;
/*** End GetDatasetRefreshScheduleInGroup***/

/*** GetDatasetQueryScaleOutStatusInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetDatasetQueryScaleOutStatusInGroup = Value.ReplaceType(
    GetDatasetQueryScaleOutStatusInGroup,
    GetDatasetQueryScaleOutStatusInGroupType
);

GetDatasetQueryScaleOutStatusInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetDatasetQueryScaleOutStatusInGroup",
    Documentation.LongDescription = "Returns the query scale-out sync status for the specified dataset from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetDatasetQueryScaleOutStatusInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as: https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/get-query-scale-out-sync-status-in-group"
        ]
    }
];

GetDatasetQueryScaleOutStatusInGroup = (optional groupId as text , optional datasetId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/datasets/" & datasetId & "/queryScaleOut/syncStatus")
    in
        result;

/*** End GetDatasetQueryScaleOutStatusInGroup ***/

/*** ExecuteQuery ***/
shared PBIRESTAPIUSGOVDOD.ExecuteQuery = Value.ReplaceType(
    ExecuteQuery,
    ExecuteQueryType
);

ExecuteQueryType = type function (
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional daxQuery as (
        type text meta [
            Documentation.FieldCaption = "DAX Query",
            Documentation.FieldDescription = "A single DAX query which includes all keywords like EVALUATE or DEFINE.",
            Documentation.SampleValues = {
                "VALUES(Table[Column])"
            }
        ]
    ),
    optional impersonatedUPN as (
        type text meta [
            Documentation.FieldCaption = "The UPN of a user to be impersonated",
            Documentation.FieldDescription = "The UPN of a user to be impersonated. If the model is not RLS enabled, this will be ignored.",
            Documentation.SampleValues = {
                "example@somedomain.com"
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.ExecuteQuery",
    Documentation.LongDescription = "Executes Data Analysis Expressions (DAX) queries against the provided dataset. The dataset must reside in My workspace or another workspace.
    DAX query errors will result in:

    A response error, such as DAX query failure.
    A failure HTTP status code (400).
    A query that requests more than one table, or more than the allowed number of table rows, will result in:

    Limited data being returned.
    A response error, such as More than one result table in a query or More than {allowed number} rows in a query result.
    A successful HTTP status code (200).
    Columns that are fully qualified in the query will be returned with a fully qualified name, for example, MyTable[MyColumn]. Columns that are renamed or created in the query will be returned within square bracket, for example, [MyNewColumn].",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.ExecuteQuery(""xxx-xxxx-abcd..."",""VALUES(Table[Column])"",""example@somedomain.com"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/execute-queries-in-group#datasetexecutequeriesqueryresult"
        ]
    }
];

ExecuteQuery = (optional datasetId as text, optional daxQuery as text, optional impersonatedUPN as text) =>
    let
        //Check arguments
        doArgumentsExist = if(datasetId <> null and datasetId <> "") and (daxQuery <> null and daxQuery <> "") then true else false,
        //Build results
        result = if doArgumentsExist = false then 
                    // See back message that arguments are required
                    #table( type table [response = text],{{"Please provide datasetId or daxQuery arguments"}})
                 else
                    let
                        /* Escape query to fit in JSON*/
                        escapeTable = #table(1, {{daxQuery}}),
                        escapedJson = Table.ReplaceValue(escapeTable,"""","\""",Replacer.ReplaceText,{"Column1"}),
                        escapedJsonQuery = Table.FirstValue(escapedJson),
                        /* Escape impersonate argument appropriately */
                        impersonate = if (impersonatedUPN <> null and impersonatedUPN <> "") then ", ""impersonatedUserName"": """ & impersonatedUPN & """"
                                    else "",
                        /* Build parameters to send */
                        params = [RelativePath = "v1.0/myorg/datasets/" & datasetId & "/executeQueries",
                                    Headers = [ #"Content-Type" = "application/json"],
                                    Content = Text.ToBinary("{""queries"":[{""query"": """ & escapedJsonQuery & """}],""serializerSettings"":{""includeNulls"": false}" & impersonate & "}")
                                ],
                        postResult = PostJSON(params)
                    in
                        postResult
    in
        result;
/*** End ExecuteQuery***/

/*** ExecuteQueryInGroup ***/
shared PBIRESTAPIUSGOVDOD.ExecuteQueryInGroup = Value.ReplaceType(
    ExecuteQueryInGroup,
    ExecuteQueryInGroupType
);

ExecuteQueryInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),    
    optional datasetId as (
        type text meta [
            Documentation.FieldCaption = "Dataset ID",
            Documentation.FieldDescription = "The Dataset ID",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional daxQuery as (
        type text meta [
            Documentation.FieldCaption = "DAX Query",
            Documentation.FieldDescription = "A single DAX query which includes all keywords like EVALUATE or DEFINE.",
            Documentation.SampleValues = {
                "VALUES(Table[Column])"
            }
        ]
    ),
    optional impersonatedUPN as (
        type text meta [
            Documentation.FieldCaption = "The UPN of a user to be impersonated",
            Documentation.FieldDescription = "The UPN of a user to be impersonated. If the model is not RLS enabled, this will be ignored.",
            Documentation.SampleValues = {
                "example@somedomain.com"
            }
        ]
    )
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.ExecuteQueryInGroup",
    Documentation.LongDescription = "Executes Data Analysis Expressions (DAX) queries against the provided dataset. The dataset must reside in My workspace or another workspace.
    DAX query errors will result in:

    A response error, such as DAX query failure.
    A failure HTTP status code (400).
    A query that requests more than one table, or more than the allowed number of table rows, will result in:

    Limited data being returned.
    A response error, such as More than one result table in a query or More than {allowed number} rows in a query result.
    A successful HTTP status code (200).
    Columns that are fully qualified in the query will be returned with a fully qualified name, for example, MyTable[MyColumn]. Columns that are renamed or created in the query will be returned within square bracket, for example, [MyNewColumn].",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.ExecuteQuery(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""VALUES(Table[Column])"",""example@somedomain.com"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/datasets/execute-queries-in-group#datasetexecutequeriesqueryresult"
        ]
    }
];

ExecuteQueryInGroup = (optional groupId as text, optional datasetId as text, optional daxQuery as text, optional impersonatedUPN as text) =>
    let
        //Check arguments
        doArgumentsExist = if(groupId <> null and groupId <> "") and (datasetId <> null and datasetId <> "") and (daxQuery <> null and daxQuery <> "") then true else false,
        //Build results
        result = if doArgumentsExist = false then 
                    // See back message that arguments are required
                    #table( type table [response = text],{{"Please provide groupId, datasetId and daxQuery arguments"}})
                 else
                    let
                        /* Escape query to fit in JSON*/
                        escapeTable = #table(1, {{daxQuery}}),
                        escapedJson = Table.ReplaceValue(escapeTable,"""","\""",Replacer.ReplaceText,{"Column1"}),
                        escapedJsonQuery = Table.FirstValue(escapedJson),
                        /* Escape impersonate argument appropriately */
                        impersonate = if (impersonatedUPN <> null and impersonatedUPN <> "") then ", ""impersonatedUserName"": """ & impersonatedUPN & """"
                                    else "",
                        /* Build parameters to send */
                        params = [RelativePath = "v1.0/myorg/groups" & groupId & "/datasets/" & datasetId & "/executeQueries",
                                    Headers = [ #"Content-Type" = "application/json"],
                                    Content = Text.ToBinary("{""queries"":[{""query"": """ & escapedJsonQuery & """}],""serializerSettings"":{""includeNulls"": false}" & impersonate & "}")
                                ],
                        postResult = PostJSON(params)
                    in
                        postResult
    in
        result;
/*** End ExecuteQueryInGroup***/


/*****************
    Reports
*****************/

/*** GetPaginatedReportDatasourcesInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetPaginatedReportDatasourcesInGroup = Value.ReplaceType(
    GetPaginatedReportDatasourcesInGroup,
    GetPaginatedReportDatasourcesInGroupType
);

GetPaginatedReportDatasourcesInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional reportId as (
        type text meta [
            Documentation.FieldCaption = "Report ID",
            Documentation.FieldDescription = "The Report ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPaginatedReportDatasourcesInGroup",
    Documentation.LongDescription = "Returns a list of data sources for the specified paginated report (RDL) from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPaginatedReportDatasourcesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""ReportSection"")",
            result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/reports/get-datasources-in-group"
        ]
    }
];

GetPaginatedReportDatasourcesInGroup = (optional groupId as text , optional reportId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/reports/" & reportId & "/datasources")
    in
        result;
/*** End GetPaginatedReportDatasourcesInGroup ***/

/*** GetReportExportToFileStatusInGroup ***/
/*** End GetReportExportToFileStatusInGroup ***/

/*** GetReportPageInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetReportPageInGroup = Value.ReplaceType(
    GetReportPageInGroup,
    GetReportPageInGroupType
);

GetReportPageInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional reportId as (
        type text meta [
            Documentation.FieldCaption = "Report ID",
            Documentation.FieldDescription = "The Report ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional pageName as (
        type text meta [
            Documentation.FieldCaption = "Page Name",
            Documentation.FieldDescription = "The page name.",
            Documentation.SampleValues = {
                "ReportSection"
            }
        ]
    )    
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetReportPageInGroup",
    Documentation.LongDescription = "Returns the specified page within the specified report from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetReportPageInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""ReportSection"")",
            result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/reports/get-page-in-group#page"
        ]
    }
];

GetReportPageInGroup = (optional groupId as text , optional reportId as text, optional pageName as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/reports/" & reportId & "/pages/" & pageName)
    in
        result;
/*** End GetReportPageInGroup***/

/*** GetReportPagesInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetReportPagesInGroup = Value.ReplaceType(
    GetReportPagesInGroup,
    GetReportPagesInGroupType
);

GetReportPagesInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional reportId as (
        type text meta [
            Documentation.FieldCaption = "Report ID",
            Documentation.FieldDescription = "The Report ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetReportPagesInGroup",
    Documentation.LongDescription = "Returns a list of pages within the specified report from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetReportPagesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/reports/get-pages-in-group#pages"
        ]
    }
];

GetReportPagesInGroup = (optional groupId as text , optional reportId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/reports/" & reportId & "/pages")
    in
        result;
/*** End GetReportPagesInGroup***/

/*** GetReportInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetReportInGroup = Value.ReplaceType(
    GetReportInGroup,
    GetReportInGroupType
);

GetReportInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional reportId as (
        type text meta [
            Documentation.FieldCaption = "Report ID",
            Documentation.FieldDescription = "The Report ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetReportInGroup",
    Documentation.LongDescription = "Returns the specified report from the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetReportInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""ReportSection"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/reports/get-report-in-group#report"
        ]
    }
];

GetReportInGroup = (optional groupId as text , optional reportId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/reports/" & reportId)
    in
        result;
/*** End GetReportInGroup***/

/*** GetReportsInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetReportsInGroup = Value.ReplaceType(
    GetReportsInGroup,
    GetReportsInGroupType
);

GetReportsInGroupType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )  
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetReportsInGroup",
    Documentation.LongDescription = "Returns a list of reports from the specified workspace. Since paginated reports (RDL) don't have a dataset, the dataset ID value in the API response for paginated reports isn't displayed.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetReportsInGroup(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/reports/get-reports-in-group#reports"
        ]
    }
];

GetReportsInGroup = (optional groupId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/reports")
    in
        result;
/*** End GetReportsInGroup***/

/*****************
    GROUPS
*****************/

/*** GetGroupUsers ***/
shared PBIRESTAPIUSGOVDOD.GetGroupUsers = Value.ReplaceType(
    GetGroupUsers,
    GetGroupUsersType
);

GetGroupUsersType = type function (
    optional groupId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The workspace ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )  
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetGroupUsers",
    Documentation.LongDescription = "Returns a list of users that have access to the specified workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetGroupUsers(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/groups/get-group-users#groupusers"
        ]
    }
];

GetGroupUsers = (optional groupId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupId & "/users")
    in
        result;

/*** GetGroups ***/
shared PBIRESTAPIUSGOVDOD.GetGroups = Value.ReplaceType(
    GetGroups,
    GetGroupsType
);

GetGroupsType = type function (
    optional filter as (
        type text meta [
            Documentation.FieldCaption = "Filter",
            Documentation.FieldDescription = "Filters the results, based on a boolean condition.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional top as (
        type number meta [
            Documentation.FieldCaption = "Top",
            Documentation.FieldDescription = "Returns only the first n results.",
            Documentation.SampleValues = {
                "5"
            }
        ]
    ),
    optional skip as (
        type number meta [
            Documentation.FieldCaption = "Skip",
            Documentation.FieldDescription = "Skips the first n results.",
            Documentation.SampleValues = {
                "10"
            }
        ]
    )              
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetGroups",
    Documentation.LongDescription = "Returns a list of workspaces the user has access to.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetGroups(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/groups/get-groups#groups"
        ]
    }
];

GetGroups = (optional filter as text, optional top as number, optional skip as number) =>
    let
        //Build Query String
        filterQS = if(filter <> null and filter <> "") then "$filter=" & filter else "",
        topQS = if(top <> null) then "$top=" & Number.ToText(top) else "",
        skipQS = if(skip <> null) then "$skip=" & Number.ToText(skip) else "",
        // Figure out if we need to concatenate with ampersand
        queryString = if(filterQS <> "" and topQS <> "" and skipQS <> "") 
                        then "?" & filterQS & "&" & topQS & "&" & skipQS
                        // 110
                        else
                            if(filterQS <> "" and topQS <> "" and skipQS = "" )
                                then 
                                    "?" & filterQS & "&" & topQS
                                    // 101
                                    else 
                                        if(filterQS <> "" and topQS = "" and skipQS <> "")
                                            then "?" & filterQS & "&" & skipQS
                                                // 011
                                                else 
                                                    if(filterQS = "" and topQS <> "" and skipQS <> "")
                                                        then "?" & topQS & "&" & skipQS
                                                            //000
                                                            else 
                                                                if(filterQS = "" and topQS = "" and skipQS = "")
                                                                    then ""
                                                                    //100 or 010 or 001 so just concatenate with ampersand
                                                                    else "?" & filterQS & topQS & skipQS,

        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups" & queryString)
    in
        result;
/*** End GetGroups ***/

/*****************
    Pipelines
*****************/

/*** GetPipeline***/
shared PBIRESTAPIUSGOVDOD.GetPipeline = Value.ReplaceType(
    GetPipeline,
    GetPipelineType
);

GetPipelineType = type function (
    optional pipelineId as (
        type text meta [
            Documentation.FieldCaption = "Pipeline ID",
            Documentation.FieldDescription = "The deployment pipeline ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional expand as (
        type text meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separate list of data types, which will be expanded inline in the response. Supports stages.",
            Documentation.SampleValues = {
                "stages"
            }
        ]
    )              
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipeline",
    Documentation.LongDescription = "Returns the specified deployment pipeline.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipeline(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipeline#pipeline"
        ]
    }
];

GetPipeline = (optional pipelineId as text, optional expand as text) =>
    let
        //Build Query String
        expandQS = if(expand <> null and expand <> "") then "$expand=" & expand else "",
        // Now query with parameters
        result = GetJSON("v1.0/myorg/pipelines/" & pipelineId & expandQS)
    in
        result;
/*** End GetPipeline ***/

/*** GetPipelineOperation***/
shared PBIRESTAPIUSGOVDOD.GetPipelineOperation = Value.ReplaceType(
    GetPipelineOperation,
    GetPipelineOperationType
);

GetPipelineOperationType = type function (
    optional pipelineId as (
        type text meta [
            Documentation.FieldCaption = "Pipeline ID",
            Documentation.FieldDescription = "The deployment pipeline ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional operationId as (
        type number meta [
            Documentation.FieldCaption = "Operation ID",
            Documentation.FieldDescription = "The operation ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    )              
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipelineOperation",
    Documentation.LongDescription = "Returns the details of the specified deploy operation performed on the specified deployment pipeline, including the deployment execution plan.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipelineOperation(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipeline-operation#pipelineoperation"
        ]
    }
];

GetPipelineOperation = (optional pipelineId as text, optional operationId as text) =>
    let
        // Now query with parameters
        result = GetJSON("v1.0/myorg/pipelines/" & pipelineId & "/operations/" & operationId)
    in
        result;
/*** End GetPipelineOperation ***/

/*** GetPipelineOperations ***/
shared PBIRESTAPIUSGOVDOD.GetPipelineOperations = Value.ReplaceType(
    GetPipelineOperations,
    GetPipelineOperationsType
);

GetPipelineOperationsType = type function (
    optional pipelineId as (
        type text meta [
            Documentation.FieldCaption = "Pipeline ID",
            Documentation.FieldDescription = "The deployment pipeline ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )              
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipelineOperations",
    Documentation.LongDescription = "Returns a list of the up-to-20 most recent deploy operations performed on the specified deployment pipeline.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipelineOperations(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipeline-operations#pipelineoperations"
        ]
    }
];

GetPipelineOperations = (optional pipelineId as text) =>
    let
        // Now query with parameters
        result = GetJSON("v1.0/myorg/pipelines/" & pipelineId & "/operations")
    in
        result;        
/*** End GetPipelineOperations ***/

/*** GetPipelineStageArtifacts ***/
shared PBIRESTAPIUSGOVDOD.GetPipelineStageArtifacts = Value.ReplaceType(
    GetPipelineStageArtifacts,
    GetPipelineStageArtifactsType
);

GetPipelineStageArtifactsType = type function (
    optional pipelineId as (
        type text meta [
            Documentation.FieldCaption = "Pipeline ID",
            Documentation.FieldDescription = "The deployment pipeline ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional stageOrder as (
        type number meta [
            Documentation.FieldCaption = "Stage Order",
            Documentation.FieldDescription = "The deployment pipeline stage order. Development (0), Test (1), Production (2).",
            Documentation.SampleValues = {
                "0"
            }
        ]
    )                   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipelineStageArtifacts",
    Documentation.LongDescription = "Returns the supported items from the workspace assigned to the specified stage of the specified deployment pipeline.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipelineStageArtifacts(""xxx-xxxx-abcd..."",""0"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipeline-stage-artifacts#pipelinestageartifacts"
        ]
    }
];

GetPipelineStageArtifacts = (optional pipelineId as text, optional stageOrder as number) =>
    let
        // Check stage order is right number
        result = if stageOrder <> 0 and stageOrder <> 1 and stageOrder <> 2 then
            #table( type table [response = text],{{"Stage Order needs to be 0 (Development), 1 (Test), or 2 (Production)"}})
        else
            // Now query with parameters
            GetJSON("v1.0/myorg/pipelines/" & pipelineId & "/stages/" & Number.ToText(stageOrder) & "/artifacts")
    in
        result; 
/*** GetPipelineStageArtifacts ***/

/*** GetPipelineStages ***/
shared PBIRESTAPIUSGOVDOD.GetPipelineStages = Value.ReplaceType(
    GetPipelineStages,
    GetPipelineStagesType
);

GetPipelineStagesType = type function (
    optional pipelineId as (
        type text meta [
            Documentation.FieldCaption = "Pipeline ID",
            Documentation.FieldDescription = "The deployment pipeline ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )                   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipelineStages",
    Documentation.LongDescription = "Returns the stages of the specified deployment pipeline.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipelineStages(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipeline-stages#pipelinestages"
        ]
    }
];

GetPipelineStages = (optional pipelineId as text) =>
    let
        // Now query with parameters
        result = GetJSON("v1.0/myorg/pipelines/" & pipelineId & "/stages")
    in
        result; 
/*** End GetPipelineStages ***/

/*** GetPipelineUsers ***/
shared PBIRESTAPIUSGOVDOD.GetPipelineUsers = Value.ReplaceType(
    GetPipelineUsers,
    GetPipelineUsersType
);

GetPipelineUsersType = type function (
    optional pipelineId as (
        type text meta [
            Documentation.FieldCaption = "Pipeline ID",
            Documentation.FieldDescription = "The deployment pipeline ID.",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    )                   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipelineUsers",
    Documentation.LongDescription = "Returns a list of users that have access to the specified deployment pipeline.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipelineUsers(""xxx-xxxx-abcd..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipeline-users#pipelineusers"
        ]
    }
];

GetPipelineUsers = (optional pipelineId as text) =>
    let
        // Now query with parameters
        result = GetJSON("v1.0/myorg/pipelines/" & pipelineId & "/users")
    in
        result;
/*** GetPipelineUsers ***/

/*** GetPipelines ***/
shared PBIRESTAPIUSGOVDOD.GetPipelines = Value.ReplaceType(
    GetPipelines,
    GetPipelinesType
);

GetPipelinesType = type function (                   
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetPipelines",
    Documentation.LongDescription = "Returns a list of deployment pipelines that the user has access to.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetPipelines()",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/pipelines/get-pipelines#pipelines"
        ]
    }
];

GetPipelines = () =>
    let
        // Now query with parameters
        result = GetJSON("v1.0/myorg/pipelines")
    in
        result;
/*** End GetPipelines ***/

/*****************
    GoalValues
*****************/

/*** GetScorecardGoalValuesInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardGoalValuesInGroup = Value.ReplaceType(
    GetScorecardGoalValuesInGroup,
    GetScorecardGoalValuesInGroupType
);

GetScorecardGoalValuesInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional goalId as (
        type text meta [
            Documentation.FieldCaption = "Goal ID",
            Documentation.FieldDescription = "The unique identifier of the goal",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    ),          
    optional expand as (
        type number meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separated list of data types, which will be expanded inline in the response. Supports notes.",
            Documentation.SampleValues = {
                "notes"
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardGoalValuesInGroup",
    Documentation.LongDescription = "Reads goal value check-ins.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardGoalValuesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."",""notes"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/goalvalues_(preview)/get#goalvalues"
        ]
    }
];

GetScorecardGoalValuesInGroup = (optional groupdId as text, optional scorecardId as text, optional goalId as text, optional expand as text) =>
    let
        //Build Query String (clean input)
        expandQS = if(expand <> null) then "$expand=" & Text.Clean(Text.Replace(expand," ","")) else "",
        // Figure out if we need to concatenate top filter
        queryString = if(expandQS <> "") 
                        then "?" & expandQS
                        else "",
        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")/goals(" & goalId & ")/goalValues" & queryString)
    in
        result;
/*** End GetScorecardGoalValuesInGroup ***/        

/*** GetScorecardGoalValueInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardGoalValueInGroup = Value.ReplaceType(
    GetScorecardGoalValueInGroup,
    GetScorecardGoalValueInGroupType
);

GetScorecardGoalValueInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional goalId as (
        type text meta [
            Documentation.FieldCaption = "Goal ID",
            Documentation.FieldDescription = "The unique identifier of the goal",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    ),
    optional timestamp as (
        type text meta [
            Documentation.FieldCaption = "Timestamp",
            Documentation.FieldDescription = "The timestamp for the value of the goal",
            Documentation.SampleValues = {
                "2021-12-14T00:00:00Z"
            }
        ]
    ),               
    optional expand as (
        type number meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separated list of data types, which will be expanded inline in the response. Supports notes.",
            Documentation.SampleValues = {
                "notes"
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardGoalValueInGroup",
    Documentation.LongDescription = "Reads a goal value check-in by a UTC date timestamp.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardGoalValueInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."",""2021-12-14T00:00:00Z"",""notes"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/goalvalues_(preview)/get-by-id#goalvalue"
        ]
    }
];

GetScorecardGoalValueInGroup = (optional groupdId as text, optional scorecardId as text, optional goalId as text, optional timestamp as datetimezone, optional expand as text) =>
    let
        //Build Query String (clean input)
        expandQS = if(expand <> null) then "$expand=" & Text.Clean(Text.Replace(expand," ","")) else "",
        // Figure out if we need to concatenate top filter
        queryString = if(expandQS <> "") 
                        then "?" & expandQS
                        else "",
        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")/goals(" & goalId & ")/goalValues(" & DateTimeZone.ToText(timestamp,[Format="O"]) & ")" & queryString)
    in
        result;
/*****************
    Goals
*****************/

/*** GetScorecardGoalsInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardGoalsInGroup = Value.ReplaceType(
    GetScorecardGoalsInGroup,
    GetScorecardGoalsInGroupType
);

GetScorecardGoalsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),             
    optional expand as (
        type number meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separated list of data types, which will be expanded inline in the response. Supports notes.",
            Documentation.SampleValues = {
                "goals($expand=goalValues, aggregations)"
            }
        ]
    ),
    optional select as (
        type number meta [
            Documentation.FieldCaption = "Select",
            Documentation.FieldDescription = "Allows the clients to select specific properties from the server.",
            Documentation.SampleValues = {
                "name,level"
            }
        ]
    )                  
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardGoalsInGroup",
    Documentation.LongDescription = "Returns a list of goals from a scorecard.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardGoalsInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",,""goals($expand=goalValues, aggregations)"",""name,level"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/goals_(preview)/get#goals"
        ]
    }
];

GetScorecardGoalsInGroup = (optional groupdId as text, optional scorecardId as text, optional expand as text, optional select as text) =>
    let
        //Build Query String (clean input)
        expandQS = if(expand <> null) then "$expand=" & Text.Clean(Text.Replace(expand," ","")) else "",
        selectQS = if(select <> null) then "$select=" & Text.Clean(Text.Replace(select," ","")) else "",
        // Figure out if we need to concatenate expand and select filters        
        queryString = if(expandQS <> "" and selectQS <> "") 
                        then "?" & expandQS & "&" & selectQS
                        else
                            // 10
                            if(expandQS <> "")
                                then 
                                    "?" & expandQS
                                else
                                // 01
                                    if(selectQS <> "")
                                        then
                                            "?" & selectQS
                                        else
                                            "",        
        
        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")/goals" & queryString)
    in
        result;
/*** End GetScorecardGoalsInGroup ***/

/*** GetScorecardGoalInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardGoalInGroup = Value.ReplaceType(
    GetScorecardGoalInGroup,
    GetScorecardGoalInGroupType
);

GetScorecardGoalInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional goalId as (
        type text meta [
            Documentation.FieldCaption = "Goal ID",
            Documentation.FieldDescription = "The unique identifier of the goal",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    ),              
    optional expand as (
        type number meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separated list of data types, which will be expanded inline in the response. Supports notes.",
            Documentation.SampleValues = {
                "goals($expand=goalValues, aggregations)"
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardGoalInGroup",
    Documentation.LongDescription = "Returns a goal by ID from a scorecard.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardGoalInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."",""goals($expand=goalValues, aggregations)"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/goalvalues_(preview)/get-by-id#goalvalue"
        ]
    }
];

GetScorecardGoalInGroup = (optional groupdId as text, optional scorecardId as text, optional goalId as text, optional expand as text) =>
    let
        //Build Query String (clean input)
        expandQS = if(expand <> null) then "$expand=" & Text.Clean(Text.Replace(expand," ","")) else "",
        // Figure out if we need to concatenate top filter
        queryString = if(expandQS <> "") 
                        then "?" & expandQS
                        else "",
        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")/goals(" & goalId & ")" & queryString)
    in
        result;
/*** End GetScorecardGoalInGroup ***/

/*** GetScorecardGoalRefreshHistoryInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardGoalRefreshHistoryInGroup = Value.ReplaceType(
    GetScorecardGoalRefreshHistoryInGroup,
    GetScorecardGoalRefreshHistoryInGroupType
);

GetScorecardGoalRefreshHistoryInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional goalId as (
        type text meta [
            Documentation.FieldCaption = "Goal ID",
            Documentation.FieldDescription = "The unique identifier of the goal",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardGoalRefreshHistoryInGroup",
    Documentation.LongDescription = "Reads refresh history of a connected goal.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardGoalRefreshHistoryInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/goals_(preview)/get-refresh-history#goalrefreshhistories"
        ]
    }
];

GetScorecardGoalRefreshHistoryInGroup = (optional groupdId as text, optional scorecardId as text, optional goalId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")/goals(" & goalId & ")/GetRefreshHistory()")
    in
        result;
/*** EndScorecardGoalRefreshHistoryInGroup ***/


/*****************
    GoalStatusRules
*****************/

/*** GetScorecardGoalsStatusRulesInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardGoalsStatusRulesInGroup = Value.ReplaceType(
    GetScorecardGoalsStatusRulesInGroup,
    GetScorecardGoalsStatusRulesInGroupType
);

GetScorecardGoalsStatusRulesInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional goalId as (
        type text meta [
            Documentation.FieldCaption = "Goal ID",
            Documentation.FieldDescription = "The unique identifier of the goal",
            Documentation.SampleValues = {
                "xxx-xxxx-ijkl..."
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardGoalsStatusRulesInGroup",
    Documentation.LongDescription = "Returns status rules of a goal.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardGoalsStatusRulesInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""xxx-xxxx-ijkl..."")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/goalsstatusrules_(preview)/get#goals.rules.goalstatusrules"
        ]
    }
];

GetScorecardGoalsStatusRulesInGroup = (optional groupdId as text, optional scorecardId as text, optional goalId as text) =>
    let
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")/goals(" & goalId & ")/statusRules")
    in
        result;
/*** End GetScorecardGoalStatusInGroup ***/

/*****************
    Scorecards
*****************/

/*** GetScorecardsInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardsInGroup = Value.ReplaceType(
    GetScorecardsInGroup,
    GetScorecardsInGroupType
);

GetScorecardsInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional top as (
        type number meta [
            Documentation.FieldCaption = "Top",
            Documentation.FieldDescription = "Returns only the first n results.",
            Documentation.SampleValues = {
                "5"
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardsInGroup",
    Documentation.LongDescription = "Returns a list of scorecards from a workspace.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardsInGroup(""xxx-xxxx-abcd..."",""5"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/scorecards_(preview)/get#scorecards"
        ]
    }
];

GetScorecardsInGroup = (optional groupdId as text, optional top as number) =>
    let
        //Build Query String
        topQS = if(top <> null) then "$top=" & Number.ToText(top) else "",
        // Figure out if we need to concatenate top filter
        queryString = if(topQS <> "") 
                        then "?" & topQS
                        else "",

        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards" & queryString)
    in
        result;
/*** End GetScorecardsInGroup ***/

/*** GetScorecardInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardInGroup = Value.ReplaceType(
    GetScorecardInGroup,
    GetScorecardInGroupType
);

GetScorecardInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional scorecardId as (
        type text meta [
            Documentation.FieldCaption = "Scorecard ID",
            Documentation.FieldDescription = "The unique identifier of the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),    
    optional expand as (
        type number meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separated list of data types, which will be expanded inline in the response. Supports goals, goalValues, aggregations, and notes.",
            Documentation.SampleValues = {
                "goals($expand=goalValues, aggregations)"
            }
        ]
    )             
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardInGroup",
    Documentation.LongDescription = "Returns a scorecard with ID.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""goals($expand=goalValues, aggregations)"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/scorecards_(preview)/get-by-id#scorecard"
        ]
    }
];

GetScorecardInGroup = (optional groupdId as text, optional scorecardId as text, optional expand as text) =>
    let
        //Build Query String (clean input)
        expandQS = if(expand <> null) then "$expand=" & Text.Clean(Text.Replace(expand," ","")) else "",
        // Figure out if we need to concatenate top filter
        queryString = if(expandQS <> "") 
                        then "?" & expandQS
                        else "",
        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards(" & scorecardId & ")" & queryString)
    in
        result;
/*** End GetScorecardInGroup ***/

/*** GetScorecardByReportIdInGroup ***/
shared PBIRESTAPIUSGOVDOD.GetScorecardByReportIdInGroup = Value.ReplaceType(
    GetScorecardByReportIdInGroup,
    GetScorecardByReportIdInGroupType
);

GetScorecardByReportIdInGroupType = type function (
    optional groupdId as (
        type text meta [
            Documentation.FieldCaption = "Group ID",
            Documentation.FieldDescription = "The unique identifier of the workspace",
            Documentation.SampleValues = {
                "xxx-xxxx-abcd..."
            }
        ]
    ),
    optional reportId as (
        type text meta [
            Documentation.FieldCaption = "Report ID",
            Documentation.FieldDescription = "The ID of the internal report associated with the scorecard",
            Documentation.SampleValues = {
                "xxx-xxxx-efgh..."
            }
        ]
    ),
    optional expand as (
        type number meta [
            Documentation.FieldCaption = "Expand",
            Documentation.FieldDescription = "Accepts a comma-separated list of data types, which will be expanded inline in the response. Supports goals, goalValues, aggregations, and notes.",
            Documentation.SampleValues = {
                "goals($expand=goalValues, aggregations)"
            }
        ]
    )                 
) as table meta [
    Documentation.Name = "PBIRESTAPIUSGOVDOD.GetScorecardByReportIdInGroup",
    Documentation.LongDescription = "Reads a scorecard associated with an internal report ID.",
    Documentation.Examples = {
        [
            Code = "=PBIRESTAPIUSGOVDOD.GetScorecardInGroup(""xxx-xxxx-abcd..."",""xxx-xxxx-efgh..."",""goals($expand=goalValues, aggregations)"")",
            Result = "Defined as https://learn.microsoft.com/en-us/rest/api/power-bi/scorecards_(preview)/get-scorecard-by-report-id#scorecard"
        ]
    }
];

GetScorecardByReportIdInGroup = (optional groupdId as text, optional reportId as text, optional expand as text) =>
    let
        //Build Query String (clean input)
        expandQS = if(expand <> null) then "$expand=" & Text.Clean(Text.Replace(expand," ","")) else "",
        // Figure out if we need to concatenate top filter
        queryString = if(expandQS <> "") 
                        then "?" & expandQS
                        else "",
        // Now query with parameters
        result = GetJSON("v1.0/myorg/groups/" & groupdId & "/scorecards/GetScorecardByReportId(reportId=" & reportId & ")" & queryString)
    in
        result;
/*** End GetScorecardByReportIdInGroup ***/

/*****************
    HELPER FUNCTIONS
*****************/
GetJSON = (optional relPath as text) =>
    let
        params = [Headers = [#"Content-Type" = "application/json"], RelativePath = relPath],
        //Get Pages
        //Hard-coded Base URL because Power BI Service won't recognize parameter despite numerous attempts
        webSource = Web.Contents(
            "https://api.mil.powerbigov.us",
            params
        ),
        //Convert to Json
        result = Text.FromBinary(webSource)
    in
        result;

PostJSON = (optional params as record) =>
    let
        //Post
        //Hard-coded Base URL because Power BI Service won't recognize parameter despite numerous attempts
        webSource = Web.Contents(
            "https://api.mil.powerbigov.us",
            params
        ),
        //Convert to Json
        result = Text.FromBinary(webSource)
    in
        result;

// Data Source Kind description
PBIRESTAPIUSGOVDOD = [
    TestConnection = (dataSourcePath) =>  { "PBIRESTAPIUSGOVDOD.FunctionCatalog"},
    Authentication = [
        Aad = [
            AuthorizationUri = "https://login.microsoftonline.us/common/oauth2/authorize",
            Resource = "https://mil.analysis.usgovcloudapi.net/powerbi/api"
        ]
    ]
];

// Data Source UI publishing description
PBIRESTAPIUSGOVDOD.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = {
        Extension.LoadString(
            "ButtonTitle"
        ),
        Extension.LoadString(
            "ButtonHelp"
        )
    },
    LearnMoreUrl = "https://github.com/kerski/powerquery-connector-pbi-rest-api-usgovdod/blob/main/README.md#functions-implemented",
    SourceImage = PBIRESTAPIUSGOVDOD.Icons,
    SourceTypeImage = PBIRESTAPIUSGOVDOD.Icons
];

PBIRESTAPIUSGOVDOD.Icons = [
    Icon16 = {
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod16.png"
        ),
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod20.png"
        ),
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod24.png"
        ),
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod32.png"
        )
    },
    Icon32 = {
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod32.png"
        ),
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod40.png"
        ),
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod48.png"
        ),
        Extension.Contents(
            "powerquery-connector-pbi-rest-api-usgovdod64.png"
        )
    }
];

//To Navigation Table
Table.ToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(
            table
        ),
        newTableType = Type.AddTableKey(
            tableType,
            keyColumns,
            true
        ) meta [
            NavigationTable.NameColumn = nameColumn,
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn,
            Preview.DelayColumn = itemNameColumn,
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(
            table,
            newTableType
        )
    in
        navigationTable;

// Force Navigation Table
Table.ForceToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(
            table
        ),
        newTableType = Type.AddTableKey(
            tableType,
            keyColumns,
            true
        ) meta [
            NavigationTable.NameColumn = nameColumn,
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn,
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(
            table,
            newTableType
        )
    in
        navigationTable;