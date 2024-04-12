/*
* help full lnks and info
* https://angular.io/guide/observables-in-angular
* https://www.bezkoder.com/angular-14-crud-example/
*/
import { Injectable } from '@angular/core';
import { HttpParams, HttpHeaders, HttpClient } from '@angular/common/http';
import { map, mergeMap, catchError } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment.dev';
const baseUrl = environment.apiEndpoint + '/api';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  constructor(private http: HttpClient) { }

  getString(model:string) {
    return this.http.get(`${baseUrl}/${model}`,{responseType: "text"});
  }

  getAll(model: string): Observable<any> {
    /*
    DEPRECIATED, USE oDataSearch INSTEAD
    DATATABLE WILL THROW A COLUMN MISMATCH ERROR SINCE I AM USING
    GENERATED TABLE HEADERS AND TABLE DATA
    SELECT STATEMENT HAS TO INCLUDE * OR SPECIFIC COLUMNS.
    */
    return this.http.get(`${baseUrl}/${model}`);
  }
  getOne(model: string, id: any): Observable<any> {
    return this.http.get(`${baseUrl}/${model}/${id}`);
  }
  create(model: string, data: any): Observable<any> {

    console.log('create URL: ' + `${baseUrl}/${model}`);
    console.log('DATA: ' + JSON.stringify(data));

    return this.http.post(`${baseUrl}/${model}`, data);
  }
  update(model: string, id: any, data: any): Observable<any> {

    console.log('update URL: ' + `${baseUrl}/${model}`);
    console.log('DATA: ' + JSON.stringify(data));
    console.log('ID: ' + id);
    //return this.http.patch(`${baseUrl}/${model}/${id}`, JSON.stringify(data)); // PATCH NOT SETUP ON DOTNET
    return this.http.put(`${baseUrl}/${model}/${id}`, data);

  }
  deleteOne(model: string, id: any): Observable<any> {
    return this.http.delete(`${baseUrl}/${model}/${id}`);
  }

  deleteAll(model: string): Observable<any> { /* NEED TO TEST THIS - CODE NOT READY */
    return this.http.delete(`${baseUrl}/${model}`);
  }

  oDataSearch(model: string, odataParams: any = null, keyValuePair:boolean = false): Observable<any> {

    /*
    12-12-2022 1245pm
    tested with auto gen header with static records. data displays and datatables works perfectly fine.
    tested with auto gen or static header with auto gen data. data displays but datatable doesnt work.
    */

    /*
    SELECT * WILL NOT INCLUDE ANY CHILD TABLES.
    */
    var temp = this.http.get(`${baseUrl}/${model}/?$Select=*`);

    if (model == "GetAllUsernames") {
      model = "usersAPI";
      odataParams = "$Select=UserId, Username";

      temp = this.http.get(`${baseUrl}/${model}/?${odataParams}`);
    }
    else if (odataParams != null) {      
     temp = this.http.get(`${baseUrl}/${model}/?${odataParams}`);
     // temp = this.http.get(`${baseUrl}/${model}/?$Select=permissionName,tableName`);
    }

    /*
    console.log('oDataSearch baseUrl:' + baseUrl);
    console.log('oDataSearch model:' + model);
    console.log('oDataSearch url:' + JSON.stringify(temp));
    console.log('oDataSearch odataParams:' + odataParams);
    */
    return temp;

     //HAVE TO CREATE WEBAPI AND TEST THIS OUT
  }

 
 
}
