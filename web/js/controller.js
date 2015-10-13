var app = angular.module('myApp', ['xeditable']);
var timeDelay = 2000;
var tempSubjectName = '';
var tempSubjectID = '';

var tempLastSubjectName = '';
var moveOperation = 0;

app.run(function(editableOptions) {
    editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});

app.controller('Ctrl', function($scope,$http) {
 
    $scope.previousSubjectNameCapture = function(lastSubjectName)
    {
        //alert("previousSubjectNameCapture is calling");
        //alert(lastSubjectName);
        tempLastSubjectName = lastSubjectName;
    }
    $scope.updateUser = function(data,subjectId) {
        
        $scope.SUBJECTNAME = data;
        $scope.SUBJECTID =  subjectId;
        if(data==tempLastSubjectName)
        {
            var alertDivMsgMatchControlProcess = 'Same String: No operation has performed';
            alertDivProcess(alertDivMsgMatchControlProcess,timeDelay);
            alertDivMsgMatchControlProcess='';
            tempLastSubjectName='';
            return 0;
        }
        $http({
            method: 'POST',
            url: 'SubjectUpdateControlProcess',
            params :  {
                processId :$scope.SUBJECTID,
                subjectName : $scope.SUBJECTNAME
            }
        })
        .success(function (response,httpStatus) {
 
            var tempAddControlProcess = angular.toJson(response);
            var processData= JSON.parse(tempAddControlProcess);
            tempSubjectName = $scope.SUBJECTNAME;
            tempSubjectID = $scope.SUBJECTID;
                
            if(processData.RSTATUS==1)
            {
                $scope.subject = {
                    SUBJECTNAME: tempSubjectName,
                    SUBJECTID: tempSubjectID
                };
            }
            else
            {
                   
                $scope.subject = {
                    SUBJECTNAME:tempLastSubjectName,
                    SUBJECTID: tempSubjectID
                }; 
            }
            var alertDivMsgUpdateControlProcess = processData.DESCRIPTION;
            alertDivProcess(alertDivMsgUpdateControlProcess,timeDelay);
            alertDivMsgUpdateControlProcess='';
            
            tempSubjectName = '';
            tempSubjectID = '';
            tempLastSubjectName='';
        })
        .error(function (response,httpStatus) {
            var alertDivMsgalertDivMsgUpdateControlProcessError = 'Request to Server Failed: - ' + httpStatus;
            alertDivProcess(alertDivMsgalertDivMsgUpdateControlProcessError,timeDelay);
            alertDivMsgalertDivMsgUpdateControlProcessError = '';
            
        });
       
    };

});

app.controller('dataController', function($scope,$http) {
    $scope.dataProcess  = function(lang) {

        var url='data/'+lang+'.data';
        $http.get(url).success( function(response,httpStatus) {
            var processData = angular.element( document.querySelector('#contain') );
            processData.html('<img id=\"centerimage\" src=\"images/loading.gif\" alt=\"Loading...\" />');
            
            if(processData!=null)
            {
                processData.html(response);
                $('#flip').removeClass('hidden').addClass('show');
                $('#commentformid').removeClass('hidden').addClass('show');
			
            }
        }).error(function(response, httpStatus) {
            // alert('Request Failed ' + httpStatus)
            alertDivMsgDataProcess = 'Request Failed ' + httpStatus;
            alertDivProcess(alertDivMsgDataProcess,timeDelay);
        });
    }
});


app.controller('subjectController', function($scope,$http) {

    $scope.sortType     = 'SUBJECTID'; // set the default sort type
    $scope.sortReverse  = false;  // set the default sort order
    $scope.custom = true;
     
    $scope.lasubjects = "";
    alertDivProcess('Loading Page',0);
            
    $scope.subjectInsertProcess  = function() {

        if(typeof $scope.SUBJECTID=='undefined')
        {
            //alert('Subject ID is mandatory field; it should be filled by number only');
            alertDivMsgSubjectId = 'Subject ID is mandatory field; it should be filled by number only';
            alertDivProcess(alertDivMsgSubjectId,timeDelay);

            return false;
        }
        if(typeof $scope.SUBJECTNAME=='undefined')
        {
            //alert('Subject Name is mandatory field');
            alertDivMsgSubjectName = 'Subject Name is mandatory field';
            alertDivProcess(alertDivMsgSubjectName,timeDelay);
            
            return false;
        }

        
        $http({
            method: 'POST',
            url: 'SubjectAddControlProcess',
            params :  {
                subjectId :$scope.SUBJECTID,
                subjectName : $scope.SUBJECTNAME
            }
        })
        .success(function (response,httpStatus) {
 
            var tempAddControlProcess = angular.toJson(response);
            var processData= JSON.parse(tempAddControlProcess);
            //alert(processData.DESCRIPTION + ", Status: " + processData.RSTATUS )
            if(processData.RSTATUS==1)
            {
                $scope.lasubjects.push({
                    'SUBJECTID':$scope.SUBJECTID, 
                    'SUBJECTNAME': $scope.SUBJECTNAME
                });

               
            }
            var alertDivMsgAddControlProcess = processData.DESCRIPTION;
            //console.log(alertDivMsgAddControlProcess);
            alertDivProcess(alertDivMsgAddControlProcess,timeDelay);
            alertDivMsgAddControlProcess='';
        })
        .error(function (response,httpStatus) {
            //alert('Request to Server Failed: - ' + httpStatus);	
            var alertDivMsgalertDivMsgAddControlProcessError = 'Request to Server Failed: - ' + httpStatus;
            alertDivProcess(alertDivMsgalertDivMsgAddControlProcessError,timeDelay);
            alertDivMsgalertDivMsgAddControlProcessError = '';
        });
    }
       
    $scope.subjectGetProcess  = function() {
        
       $scope.custom = false;
        $http({
            method: 'GET',
            url: 'SubjectGetControlProcess'
        })
        .success(function (response,httpStatus) {
            
            var tempGetControlProcess = angular.toJson(response);
            var processData = JSON.parse(tempGetControlProcess);
            $scope.lasubjects = processData.SUBJECTS;
            $scope.custom = true;
            var alertDivMsgDeleteControlProcess = processData.DESCRIPTION;
            //console.log(alertDivMsgDeleteControlProcess);
            alertDivProcess(alertDivMsgDeleteControlProcess,timeDelay);
            alertDivMsgDeleteControlProcess = '';
        })
        .error(function (response,httpStatus) {
            //alert('Request to Server Failed: - ' + httpStatus);
            alertDivMsgGetControlProcessError = 'Request to Server Failed: - ' + httpStatus;
            alertDivProcess(alertDivMsgGetControlProcessError,timeDelay);
            alertDivMsgGetControlProcessError = '';
        });
    }
    
    $scope.subjectEditProcess  = function(processId) {
        alert("Id :  " + processId);
    }
    
    $scope.subjectRemoveProcess  = function(processId) {
         
        $scope.processId = processId;
        $http({
            method: 'POST',
            url: 'SubjectDeleteControlProcess',
            params :  {
                processId : $scope.processId
            }
        })
        .success(function (response,httpStatus) {
 
            var tempDeleteControlProcess = angular.toJson(response);
            var processData= JSON.parse(tempDeleteControlProcess);
            if(processData.RSTATUS==1)
            {
                var row = document.getElementById(processId);
                row.parentNode.removeChild(row);
                    
            }
            //alert(processData.DESCRIPTION + ", Status: " + processData.RSTATUS )
            var alertDivMsgDeleteControlProcess = "Subject ID: " + processId + " - " + processData.DESCRIPTION;
            //console.log(alertDivMsgDeleteControlProcess);
            alertDivProcess(alertDivMsgDeleteControlProcess,timeDelay);
            alertDivMsgDeleteControlProcess = '';
        })
        .error(function (response,httpStatus) {
            //alert('Request to Server Failed: - ' + httpStatus);	
            var alertDivMsgDeleteControlProcessError = 'Request to Server Failed: - ' + httpStatus;
            alertDivProcess(alertDivMsgDeleteControlProcessError,timeDelay);
            alertDivMsgDeleteControlProcessError= '';
        });
    }
        
});


