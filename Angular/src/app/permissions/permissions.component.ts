import { KeyValue } from '@angular/common';
import { Component, ElementRef, OnInit, ViewChild, Input, OnChanges, OnDestroy } from '@angular/core';
import { waitForAsync } from '@angular/core/testing';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { DataService } from '../services/data.service';
import { StringFunctionsService } from '../services/string-functions.service';


@Component({
  selector: 'app-permissions',
  templateUrl: './permissions.component.html',
  styleUrls: ['./permissions.component.scss']
})
export class PermissionsComponent implements OnInit, OnChanges {
 @ViewChild(DataTableDirective,{static: false})  dtElement!: DataTableDirective;

 @Input() oDataInput: any = null;
 
  routeSubscription: any;
  entities:any;
  entityName ='permissionsAPI';
  primaryIdName: string = "PermissionId";

  primaryIdUpdateInput: number = 0;

  dtTrigger: any = new Subject<any>();
  dtOptions: DataTables.Settings = {
    pagingType: 'full_numbers',lengthMenu: [10,25,50,75,100]
  };

  btnFilter: boolean = false;
  btnFilterValues: any;
  filterBy = "";

  // NAMES MUST BE SAME AS THE MODEL ON SERVER SIDE

  tableTH: any = [
    //PermissionID: "Permission_ID",
    "TableName",
    "PermissionName",
    "DisplayName",
    "CreatedAt",
    "UpdatedAt"
  ];

  tableTHDefault: any = [
    //PermissionID: "Permission_ID",
    "TableName",
    "PermissionName",
    "DisplayName",
    "CreatedAt",
    "UpdatedAt"
  ];

//  SELECT ARE CASE SENSITIVE! 
  //odataParams = `$Select=*&$filter=PermissionId lt 15`;// THIS IS WORKING
  //odataQueryString = $Select=*%26$filter=PermissionId lt 15    // THIS IS WORKING
  //odataParams = `$Select=TableName,PermissionName,DisplayName,CreatedAt,UpdatedAt&$filter=permissionId lt 15`;// THIS IS WORKING
  //odataQueryString = $Select=TableName,PermissionName,DisplayName,CreatedAt,UpdatedAt%26$filter=permissionId lt 15    // THIS IS WORKING
  odataParams = `$Top=99999&$Select=*`;// THIS IS WORKING
 //odataParams = `null`;// THIS IS WORKING

  constructor(
    private dataService: DataService
    , public stringService: StringFunctionsService
    , private activatedRoute: ActivatedRoute
    , public router: Router
    ) { }

  ngOnInit(): void {

    //console.log('ngOnInit()');
   // this.dtOptions = { pagingType: 'full_numbers',lengthMenu: [10,25,75,100],}
    this.routeSubscription = this.activatedRoute.queryParams.subscribe(params => {

      if (params["oDataQuery"]) {
        this.oDataInput = params["oDataQuery"].toString().replace('%26','&');
        console.log(`ngOnInit odata: ${params["oDataQuery"].toString()}`);
      }
      
      console.log(`ngOnInit oDataInput: ${this.oDataInput}`);
      this.loadRecords(this.oDataInput);

    })

    this.loadUsers();

  }

  ngOnDestroy() {
    console.log(`permission ngOnDestroy: ${this.primaryIdUpdateInput}`);
    this.primaryIdUpdateInput = 0;
    this.entities = null;
  }

  ngOnChanges() {
    console.log(`permission ngOnChanges: ${this.oDataInput}`);
    this.loadRecords(JSON.parse(this.oDataInput));    
  }

  setSearch(searchText: string){
    console.log(`setSearch searchText: ${searchText}`);

    /* FOLLOWING CODE SETS SEARCH TEXT AND ACTIVATES IT FOR THE DATATABLE TO USE */
    
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.search(searchText).draw();      
    });

  }

  setPrimaryId(entity: any){
    console.log(`setPrimaryId`);

    if (entity != null) {
      console.log(`setPrimaryId entity: ${JSON.stringify(entity)}`);
      console.log(`setPrimaryId entity: ${entity[this.primaryIdName]}`);
      this.primaryIdUpdateInput = entity[this.primaryIdName];
      // NOTE: ngOnChanges HOOK WILL NOT BE CALL IF @INPUTS HAS NO CHANGE
    } else {
      this.primaryIdUpdateInput = 0;
    }
    
  }

  setSelectedValue(fitlerID: number, filterName: string){
    console.log(`setSelectedValue fitlerVal: ${fitlerID}`);
    if (fitlerID != null || fitlerID != undefined){
      this.odataParams = `$select=*&$filter=CreatedBy eq ${fitlerID}`;
      this.setRefreshPage();
    }

    if (filterName != null || filterName != undefined){
      this.filterBy = `for ${filterName}`;
    }
  }

  loadRecords(odata: any = null){
    // 12-6-2022 TESTED WITH ODATA PARAM AND NULL, BOTH WORKS
    console.log(`loadRecords odata: ${odata}`);
    console.log(`loadRecords primaryIdName: ${this.primaryIdName}`);
    //.log(`loadRecords odata.search: ${odata.search(this.primaryIdName) }`);

    if(odata == null){}
    else if (odata.search(this.primaryIdName)  == -1){
      /*
      5-27-2023 SEARCH FOR PRIMARY ID IN ODATA STRING. 
      IF NOT FOUND IN SELECT, ADD IN PRIMARY ID CALL TO THE ODATA STRING
      PRIMARY ID IS ALWAYS REQUIRED BUT NEVER DISPLAYED
      THE SELECT ALSO UPDATES THE TABLE HEADERS 
      PARSE EEXAMPLE: $Select=TableName,PermissionName,DisplayName,CreatedAt,UpdatedAt&$filter=permissionId lt 150
    */

      var leftIndex: number = odata.toString().indexOf("=") + 1
      var rightIndex:number = leftIndex  ;
      var strLength: number = odata.length ;
      var leftPart:string = odata.toString().slice(0,leftIndex);
      var rightPart:string = odata.toString().slice(rightIndex, strLength);
      var endleftIndex: number = odata.toString().indexOf("&");
      var newColNames: any = odata.toString().slice(leftIndex, endleftIndex);


      console.log(`loadRecords leftIndex: ${leftIndex}`);

      console.log(`loadRecords rightIndex: ${rightIndex}`);

      console.log(`loadRecords strLength: ${strLength}`);

      console.log(`loadRecords leftPart: ${leftPart}`);

      console.log(`loadRecords rightPart: ${rightPart}`);

      this.odataParams = leftPart + `${this.primaryIdName},` + rightPart;

      console.log(`loadRecords concat odataParams: ${this.odataParams}`);

      console.log(`loadRecords newColNames: ${newColNames}`);

      this.tableTH = newColNames.toString().split(",");

      if (odata.toString().indexOf("$Select=*")>-1){
        this.tableTH = this.tableTHDefault;
      }

    }
    else if (odata) {
      this.odataParams = odata;
    } 
    console.log(`loadRecords entities: ${JSON.stringify(this.entities)}`);
    this.dataService.oDataSearch(this.entityName,this.odataParams).subscribe(data => {

    this.entities = data;
      this.dtTrigger.next();
    
    });

    
  }

  removeRecord(entity: any){
    console.log(`removeRecord`);

    this.dataService.deleteOne(this.entityName, entity[this.primaryIdName]).subscribe(deleteLogs => {
      console.log(`deleteLogs: ${deleteLogs}`);

      if (deleteLogs != null){    
        this.setRefreshPage();
      }
    });
  }

  setRefreshPage(searchText: string = ""){
    console.log(`setRefreshPage searchText: ${searchText}`);

    this.dataService.oDataSearch(this.entityName,this.odataParams).subscribe(data => {

      this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
        dtInstance.clear();
        dtInstance.destroy();

      }).finally(()=>{this.setSearch(searchText)});

      this.entities = data;

      this.dtTrigger.next();
    });

  }

  loadUsers(){
    console.log('loadUsers()');
    this.dataService.oDataSearch('GetAllUsernames').subscribe( response => {
      console.log(`loadUsers: ${JSON.stringify(response)}`);
      this.btnFilterValues = response;
    })
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
