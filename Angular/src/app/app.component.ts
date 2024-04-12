import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { map, mergeMap, catchError } from 'rxjs/operators';
import { DataService } from '../app/services/data.service';
import { StringFunctionsService } from '../app/services/string-functions.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'Angular';

  entityName ='homeAPI';

  constructor(
    private dataService: DataService
    , public stringService: StringFunctionsService
    , private activatedRoute: ActivatedRoute
    , public router: Router
    ) { }

    ngOnInit() {
      this.loadCredentials();
    }
  
    loadCredentials(){
      console.log(`loadCredentials`);
      this.dataService.getString(this.entityName).subscribe( response => {
        console.log(`reponse: ${response}`);
      });
    }
}
  
