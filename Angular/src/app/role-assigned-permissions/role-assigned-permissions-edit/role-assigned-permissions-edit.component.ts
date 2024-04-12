import { KeyValue } from '@angular/common';
import { Component, ElementRef, OnInit, ViewChild, Input, OnChanges, Output, EventEmitter } from '@angular/core';
import { ActivatedRoute, Router, Params} from '@angular/router';
import { FormControl, FormGroup, FormBuilder, Validators, NgForm } from '@angular/forms';
import { DataService } from '../../services/data.service';
import { StringFunctionsService } from '../../services/string-functions.service';

@Component({
  selector: 'app-role-assigned-permissions-edit',
  templateUrl: './role-assigned-permissions-edit.component.html',
  styleUrls: ['./role-assigned-permissions-edit.component.scss']
})

export class RoleAssignedPermissionsEditComponent implements OnInit, OnChanges {
  @ViewChild('successAlert') successAlert!: ElementRef;
  @ViewChild('closeModal') closeModal!: ElementRef;
  @ViewChild('formGroupReset') formGroupReset: any;

  @Input() primaryIdInput: any = null;
  @Output() refreshParentPage = new EventEmitter();

  title = "Role Assigned Permissions";
  curDate = new Date().getFullYear();
  nullDate = null;

  routeSubscription: any;
  entity: any ={};
  entityName ='RoleAssignedPermissionsAPI';

  primaryForm: any  = new FormGroup({
    RoleAssignedPermissionId: new FormControl(),
    PermissionId: new FormControl(),
    RoleId : new FormControl(),
  });
  submitClicked: boolean = false;

  primaryIdName : string = "RoleAssignedPermissionId";
  callbackSearchText: string = ""; //USE ONE OF THE REQUIRED FORM FIELDS

  valuePair1:any = "";
  valuePair2:any = "";

  /*
      USE dynFormBuilder VARIABLE TO BUILD THE HTML FORM FOR YOU. 
  */

  /* THESE ARE THE SUPPORTED FIELDS AND PROPERTIES
    {id: "UserLogId", name:"user log id", elementType:"infoTextfield", required: false, value:"", class:""},
    {id: "comment", name:"comment", elementType:"infoTextarea",value:"", class:"" },
    {id: "hiddenname", name:"hidden name", elementType:"hidden",value:"", class:"" },
    {id: "firstname", name:"fisrt name", elementType:"textfield",value:"", class:"" },
    {id: "comment", name:"comment", elementType:"textarea",value:"", class:"" },
    {id: "gender", name:"gender", elementType:"radiobox",value:{1:"male", 2:"female"}, class:"" },
    {id: "genderfluid", name:"gender fluid", elementType:"checkbox",value:{1:"male", 2:"female"}, class:"" },
    {id: "favoritecar", name:"favorite cars", elementType:"dropdown",value:{1:"BMW",2:"Toyota",3:"Volkswagen",4:"Hyundai",5:"Kia",6:"GM",7:"Ford",8:"Nissan",9:"Honda",10:"Mazda",}, class:"" },
    {id: "favoritecarmulti", name:"favorite cars multi-select", elementType:"listbox",value:{1:"BMW",2:"Toyota",3:"Volkswagen",4:"Hyundai",5:"Kia",6:"GM",7:"Ford",8:"Nissan",9:"Honda",10:"Mazda",}, class:"" },
  */

  dynFormBuilder: any = [
    {id: "RoleAssignedPermissionId", name:"Role Assigned Permission Id", elementType:"hidden", required: false, value:"", class:""},
    {id: "PermissionId", name:"Permission Id", elementType:"dropdown", required: true, value:{1:"non", 2:"nothing"}, class:""},
    {id: "RoleId", name:"Role Id", elementType:"dropdown", required: true, value:"", class:"" },
  ];

  SubmitButton: boolean = true;

  constructor(private formBuilder: FormBuilder
    , private activatedRoute: ActivatedRoute
    , private dataService: DataService
    , public stringService: StringFunctionsService 
    ) {
  }

  ngOnInit() {
    console.log(`ngOnInit: ${this.primaryIdInput}`);

    // FROM QUERYSTRING, SO ID CAN BE CONSUMED AS A STANDALONE PAGE AS WELL AS AN EMBED
    this.routeSubscription = this.activatedRoute.queryParams.subscribe((params: Params) => {

      if (params['id'] !== undefined && params['id'] !== null) {
        this.primaryIdInput = +params['id'];
      }

    });

    if (this.primaryIdInput !== undefined && this.primaryIdInput !== null) {

      this.loadRecord();
    } else {
      this.newRecord();
    }

  }




  ngOnChanges() {

    console.log(`ngOnChanges: ${this.primaryIdInput}`);
    if (this.primaryIdInput > 0) {

      this.loadRecord();
    } else {
      this.newRecord();
    }

  }

  onSubmit() {
    this.submitClicked = true;

    //USE ONE OF THE REQUIRED FORM FIELDS
    this.callbackSearchText = this.primaryForm.value['Username']; 

    if (this.primaryForm.valid) {
      if (this.primaryIdInput > 0) { 

        this.dataService.update(this.entityName, this.primaryIdInput, this.primaryForm.value).subscribe(updatelogs => {
          console.log(`updatelogs: ${updatelogs}`);
          this.displayNotification();
          this.closeModal.nativeElement.click();

          if (updatelogs != null){
            this.refreshParentPage.emit(this.callbackSearchText)
          }
        });

      } else {         

          delete this.primaryForm.value[this.primaryIdName];

          this.dataService.create(this.entityName, this.primaryForm.value).subscribe(createLogs => {
          console.log(`createLogs: ${createLogs}`);
          this.displayNotification();
          this.closeModal.nativeElement.click();
          
          if (createLogs != null){
            this.onReset();  
            this.refreshParentPage.emit(this.callbackSearchText)//callbackSearchText
          }
        });
      }
    }
 
  }

  onReset() {
    //reset validation css
    this.primaryForm.reset();//({tounched: false,untouched: true, valid: true, invalid: false, dirty: false, pristine: true })
    this.formGroupReset.nativeElement.classList.remove('ng-submitted');
    this.formGroupReset.nativeElement.classList.remove('was-validated');
    
  }

  displayNotification() {
    this.successAlert.nativeElement.hidden = false;
    setTimeout(() => {
      this.successAlert.nativeElement.hidden = true;
    }, 2000);
  }

  newRecord() {
    // NEW RECORDS
    console.log(`newRecord`);

    this.primaryForm = new FormGroup({
      RoleAssignedPermissionId: new FormControl(),
      PermissionId: new FormControl(null, {nonNullable: true}),
      RoleId: new FormControl(null, {nonNullable: true}),
 
    });

  }
/*
  resolveAfter2Seconds() {
console.log(`this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName"): ${this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName")}`);   

//this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName")
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName"));
      }, 2000);
    });
  }*/

  private loadRecord() {
    // LOAD RECORDS
    console.log(`loadRecord() primaryIdInput: ${this.primaryIdInput}`);

    if (this.primaryIdInput > 0 ) {
      this.dataService.getOne(this.entityName, this.primaryIdInput)
      .subscribe(data => {
        this.entity = data;
        let rs = data;
        this.primaryForm.patchValue({

          RoleAssignedPermissionId: rs.roleAssignedPermissionId,
          PermissionId: rs.permissionId,
          RoleId : rs.roleId,

        });
      });
    }

    // INITIAL VALUES IN LIST IF NECCESSARY

    var temp = this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName").toPromise();
    
   // console.log(`loadRecord loadKVPairs: ${JSON.parse(temp)}`); 
    //var temp2 = {"8:Contractor","7:Administrative","6:Professional","5:Supervisor","4:Manager","3:Executive","2:ApplicationSupport","1:Administrator"};
      /*
      var promise = new Promise((resolve, reject)=>{
        resolve(this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName"));
      })
      promise.then((success) => { 
        console.log(`success: ${success}`); 
      }) */

      this.dynFormBuilder[1]['value'] = this.loadKVPairs("RolesAPI","$Select=RoleID,RoleName").toPromise();;
      console.log(`loadRecord loadKVPairs: ${JSON.stringify(this.dynFormBuilder[1]['value'] )}`); 
      //console.log(`loadRecord promise val: ${JSON.stringify(val)}`)
      console.log(`loadRecord promise dynFormBuilder: ${JSON.stringify(this.dynFormBuilder)}`)
    

     
  }

  /**
   * var promise = new Promise((resolve, reject) => { 
    resolve("Promise Resolved"); 
}) 

promise.then((success) => { 
        console.log(success); 
    }) 
    .catch(function(error) => { 
        console.log(error); 
    }); 
// Output: Promise Resolved

   */

  /*
  1-10-2024 return data is JSON is good. need to make this from a +ise so it will besure to return the data on time.
  right now its not working properly cuz it is not returned on time.
  */
  loadKVPairs(entityName: string, odata: any = null): any {


    // USED TO LOAD VALUE PAIRS TO INITIALIZE DROPDOWNS AND OR LISTBOX TYPE CONTROLS
    console.log(`loadValuePairs entityName: ${entityName}`);
    console.log(`loadValuePairs odata: ${odata}`);
    //console.log(`loadRecords odata.search: ${odata.search(this.primaryIdName) }`);
    var returnStr: string = "";
    if(odata != null){

       this.dataService.oDataSearch(entityName,odata).subscribe(data => {
        //console.log(`loadValuePairs data stringify: ${JSON.stringify(data)}`);
       // returnStr = data
        //console.log(`loadValuePairs data parse: ${JSON.parse(data)}`);
        var arr = data;
        var newArrStr ="";
        console.log(`loadValuePairs newArrStr.length: ${newArrStr.toString().length}`);
        for(var i in arr){

          //console.log(`loadValuePairs newArrStr: ${JSON.stringify(arr[i])}`);
          var kvArr = arr[i];
          var countKV = 0;
          var keyArr = "";
          var valueArr = "";

          for (var j in kvArr){ //THE INDEX IS NOT A NUMBER. INDEX IS WHATEVER THE KEY IS.
            console.log(`loadValuePairs kvArr index: ${j}`);
            console.log(`loadValuePairs kvArr: ${kvArr[j]}`);
            if (countKV == 0) {
              keyArr = kvArr[j]
            }
            else {
              valueArr = kvArr[j]
              countKV = 0;
              
              if (newArrStr.toString().length == 0){
                newArrStr = `"${keyArr}":"${valueArr}"`;
              } else {
                newArrStr += `,"${keyArr}":"${valueArr}"`;
              }
            
              console.log(`loadValuePairs newArrStr.length: ${newArrStr.toString().length}`);
              console.log(`loadValuePairs keyArr: ${keyArr}`);
              console.log(`loadValuePairs valueArr: ${valueArr}`);
              console.log(`loadValuePairs newArrStr: ${(newArrStr)}`);
            }
            countKV++;

          }
            
        }
        newArrStr = "{" + newArrStr + "}";
        //console.log(`loadValuePairs newArrStr: ${JSON.parse(newArrStr)}`);

        
      //  returnStr = this.stringService.getReplaceAll(JSON.stringify(newArrStr).toString(),"[","{")

      //  returnStr = this.stringService.getReplaceAll(returnStr,"]","}")
      //console.log(`loadValuePairs newArrStr: ${JSON.stringify(newArrStr)}`);   
        returnStr = JSON.parse(newArrStr)
        console.log(`loadValuePairs returnStr1: ${JSON.stringify(returnStr)}`);        
        
      });
      
        
    } 
//    console.log(`loadValuePairs returnStr2: ${returnStr}`); 
    //console.log(`loadValuePairs returnStr2: ${JSON.parse(returnStr,)}`); 
    //console.log(`loadValuePairs returnStr2: ${JSON.stringify(returnStr)}`); 
    return returnStr;
    
  }

  setSelected(formControlNameID: string, elementValue: any){
    
    let tempValue =  this.stringService.toBoolean(elementValue.target.value);
    let tempMultiValue = elementValue.target.selectedOptions;

    if (this.primaryForm.value[formControlNameID] != null) {
     
      var tempMultiOut;
      
      //PROCESS MULTI SELECTS .value / .label
      for (let i = 0; i < tempMultiValue.length; i++) {

        if (tempMultiValue.length == 0) {
          tempMultiOut = tempMultiValue[i].value;
        } else {
          tempMultiOut += "," + tempMultiValue[i].value;
        }  

        tempMultiOut = this.stringService.getReplaceAll(tempMultiOut,"undefined,","");
    
      }

      if (tempMultiValue.length > 1) {
        tempValue = tempMultiOut;
      }
           
      if (this.primaryForm.value[formControlNameID].toString().toLowerCase() != tempValue.toString().toLowerCase()){
   
        this.primaryForm.value[formControlNameID] = tempValue;
    
      } 
  
    }

  }

  setChecked(formControlNameID: string, elementValue: any){ //12-15-2023  THIS ONE TESTED AND WORKING FOR RADIOBOX
    
    if (this.primaryForm.value[formControlNameID] != null) {

      if (this.primaryForm.value[formControlNameID].toString().toLowerCase() != elementValue.toString().toLowerCase()){
        this.primaryForm.value[formControlNameID] = elementValue;
    
      } 
  
    }

  }

  getChecked(formControlNameID: string, elementValue: any):boolean{
    // WORKS WITH ONE OR MANY SELECTED VALUES
    let temp = false; 
    
    if (this.primaryForm.value[formControlNameID] != null) {

      if (this.primaryForm.value[formControlNameID].toString().toLowerCase().indexOf(",")>-1){
        if (this.primaryForm.value[formControlNameID].toString().toLowerCase().indexOf(elementValue.toString().toLowerCase())>-1){
          temp = true;
        }   
      }
      else if (this.primaryForm.value[formControlNameID].toString().toLowerCase() == elementValue.toString().toLowerCase()){
        temp = true;
      } 
  
    }

    return temp;
  }
  
  /*
  * THE FOLLOWING ARE USED WITH KEYVALUE PIPE
  */

  // Preserve original property order
  originalOrder = (a: KeyValue<string,string>, b: KeyValue<string,string>): number => {
    return 0;
  }

  // Order by ascending property value
  valueAscOrder = (a: KeyValue<string,string>, b: KeyValue<string,string>): number => {
    return a.value.localeCompare(b.value);
  }

  // Order by descending property key
  keyDescOrder = (a: KeyValue<string,string>, b: KeyValue<string,string>): number => {
    return a.key > b.key ? -1 : (b.key > a.key ? 1 : 0);
  }

}