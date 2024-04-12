import { KeyValue } from '@angular/common';
import { Component, ElementRef, OnInit, ViewChild, Input, OnChanges, Output, EventEmitter } from '@angular/core';
import { ActivatedRoute, Router, Params} from '@angular/router';
import { FormControl, FormGroup, FormBuilder, Validators, NgForm } from '@angular/forms';
import { DataService } from '../../services/data.service';
import { StringFunctionsService } from '../../services/string-functions.service';


@Component({
  selector: 'app-db-logs-edit',
  templateUrl: './db-logs-edit.component.html',
  styleUrls: ['./db-logs-edit.component.scss']
})
export class DblogsEditComponent implements OnInit, OnChanges {
  @ViewChild('successAlert') successAlert!: ElementRef;
  @ViewChild('closeModal') closeModal!: ElementRef;
  @ViewChild('formGroupReset') formGroupReset: any;

  @Input() primaryIdInput: any = null;
  @Output() refreshParentPage = new EventEmitter();

  title = "DbLogs";
  curDate = new Date().getFullYear();
  nullDate = null;

  routeSubscription: any;
  entity: any ={};
  entityName ='DbLogsAPI';

  /*    
  //"DbLogId",
    "TableName",
    "ColumnName",
    "ColumnType",
    "ColumnOldValue",
    "ColumnNewValue",
    "CreatedAt",
    "CreatedBy",
    */

  primaryForm: any  = new FormGroup({
    PermissionId: new FormControl(),
    TableName: new FormControl(),
    PermissionName : new FormControl(),
    DisplayName: new FormControl(),
    CreatedAt: new FormControl(),
    UpdatedAt: new FormControl(),

  });
  submitClicked: boolean = false;

  primaryIdName : string = "DbLogId";
  callbackSearchText: string = ""; //USE ONE OF THE REQUIRED FORM FIELDS

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
    {id: "DbLogId", name:"DbLog Id", elementType:"infoTextfield", required: false, value:"", class:""},
    {id: "TableName", name:"table name", elementType:"infoTextfield", required: false, value:"", class:"" },
    {id: "ColumnName", name:"Column Name", elementType:"infoTextfield", required: false, value:"", class:""},
    {id: "ColumnType", name:"Column Type", elementType:"infoTextarea", required: false, value:"", class:"" },
    {id: "ColumnOldValue", name:"Column Old Value", elementType:"infoTextarea", required: true,value:"", class:"" },
    {id: "ColumnNewValue", name:"Column New Value", elementType:"infoTextarea", required: true,value:"", class:"" },
    {id: "CreatedAt", name:"created at", elementType:"infoTextfield", required: false ,value:"", class:"" },
    {id: "CreatedBy", name:"Created By", elementType:"infoTextfield", required: false,value:"", class:"" },
  ];

  SubmitButton: boolean = false;

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
      DbLogId: new FormControl(),
      TableName: new FormControl(null, {nonNullable: true}),
      ColumnName : new FormControl(null, {nonNullable: true}),
      ColumnType: new FormControl(null, {nonNullable: true}),
      ColumnOldValue : new FormControl(null, {nonNullable: true}),
      ColumnNewValue: new FormControl(null, {nonNullable: true}),
      CreatedAt: new FormControl(null, {nonNullable: true}),
      CreatedBy: new FormControl(null, {nonNullable: true}),

    });

  }

      /*
        //"DbLogId",
   // "TableName",
    "ColumnName",
   // "ColumnType",
    "ColumnOldValue",
    "ColumnNewValue",
    "CreatedAt",
   // "CreatedBy",
    */

  private loadRecord() {
    // LOAD RECORDS
    console.log(`loadRecord() primaryIdInput: ${this.primaryIdInput}`);

    if (this.primaryIdInput > 0 ) {
      this.dataService.getOne(this.entityName, this.primaryIdInput)
      .subscribe(data => {
        this.entity = data;
        let rs = data;
        this.primaryForm.patchValue({

          DbLogId: rs.dbLogId,
        TableName: rs.tableName,
        ColumnName : rs.columnName,
        ColumnType: rs.columnType,
        ColumnOldValue : rs.columnOldValue,
        ColumnNewValue: rs.columnNewValue,
        CreatedAt: rs.createdAt, //NOT REQUIRED / NULLABLE IN THE MODEL
        CreatedBy: rs.createdBy, //NOT REQUIRED / NULLABLE IN THE MODEL

        });
      });
    }
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
