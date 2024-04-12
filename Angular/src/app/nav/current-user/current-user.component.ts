import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { map, mergeMap, catchError } from 'rxjs/operators';
import { DataService } from '../../services/data.service';
import { StringFunctionsService } from '../../services/string-functions.service';


@Component({
  selector: 'app-current-user',
  templateUrl: './current-user.component.html',
  styleUrls: ['./current-user.component.css']
})
export class CurrentUserComponent implements OnInit {

  entityName ='homeAPI/GetUsername';

  currentUser  = 'no user';

  constructor(
    private dataService: DataService
    , public stringService: StringFunctionsService
    , private activatedRoute: ActivatedRoute
    , public router: Router
    ) { }

    ngOnInit() {
      console.log(`ngOnInit`);
      /* 11/14/2023 NEED TO TAP INTO HOMEAPI TO INITIALIZE PERMISSIONS  */
      this.loadCredentials();
    }
  
    loadCredentials(){
      console.log(`loadCredentials`);
      this.dataService.getString(this.entityName).subscribe( response => {
        this.currentUser = response;
      });
    }
}

