import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { DataService } from '../services/data.service';
import { StringFunctionsService } from '../services/string-functions.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  //entityName ='homeAPI';

  constructor(
    private dataService: DataService
    , public stringService: StringFunctionsService
    , private activatedRoute: ActivatedRoute
    , public router: Router
    ) { }

  ngOnInit() {

  }



}
