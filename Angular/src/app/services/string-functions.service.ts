import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class StringFunctionsService {

  emailRegex: RegExp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  /*
   accepted formats:
   (###) ###-####
   ###-###-####
  */
  phoneRegex: RegExp = /^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;
  /*
   accepted formats:
   #####-####
   #####
  */
  zipRegex: RegExp = /^[0-9]{5}(?:-[0-9]{4})?$/;
  /*
  MM/DD/YYYY
  */
  dateRegex: RegExp = /^((0|1)\d{1})[-]?|[/]?((0|1|2)\d{1})[-]?|[/]?((19|20)\d{2})/;
  /*
  ##:##
  */
  timeRegex: RegExp = /^(10|11|12|[1-9]):[0-5][0-9]$/;

  /*
  2023-07-07 13:44:18.3410107
  */
  dateRegexDB: RegExp = /[1-2][0-9][0-9][0-9][-][0-9][0-9][-][0-9][0-9]/; //PIPE WITH 'short'
  timeRegexDB: RegExp = /[0-2][0-9][:][0-9][0-9][:][0-9][0-9]/; // PIPE WITH 'shorttime'

  constructor() { }

  getDateTime(input: string): string{
    var temp = "";

    if (this.isDateTime(input) == true) {
      temp = new Date(input).toString();
    }
    return temp;
  }

  getReplaceAll(inputStr: string, findStr: string, replaceStr: string): string{
    var temp = "";

    if (inputStr.toString().indexOf(findStr) > -1){
      temp = this.getReplaceAll(inputStr.replace(findStr, replaceStr),findStr , replaceStr);

    } else {
      temp = inputStr;
      //console.log(`getReplaceAll inputStr: ${inputStr}`);
    }

    return temp;

  }

  getBrokenLongString(input: string): string{

    var temp = "";    

    input = input==null?"":input;

       // console.log(`getBrokenLongString input.length: ${input.toString().length}`);
   //console.log(`getBrokenLongString input.indexOf(" "): ${input.toString().indexOf(" ")}`);
    //console.log(`getBrokenLongString input.replace("."," "): ${input.replace(new RegExp('.', 'g'), ' ')}`);
    
    if (input.toString().indexOf("`") > -1){
      temp = this.getReplaceAll(input, "`"," ");
      temp = this.getReplaceAll(temp, "["," ");
      temp = this.getReplaceAll(temp, "]"," ");
      temp = this.getReplaceAll(temp, "."," ");
    } else {
      temp = input;
    }
    
    //console.log(`getBrokenLongString input: ${input}`);
    return temp;
  }


  isDescBox(input: string): string{

    var temp = "";

    input = input==null?"":input;

    //console.log(`isDescBox input.toString().length: ${input.toString().length}`);

    if (input.toString().length > 50) {
      temp = "desc-box";
    }

    return temp;
  }

  isDateTime(input: string): boolean{
    var temp = false;

    var currentDt = new Date(input);
    var mm = currentDt.getMonth() + 1;
    var dd = currentDt.getDate();
    var yyyy = currentDt.getFullYear();
    var date = mm + '/' + dd + '/' + yyyy;

    /*

    if (input == null || input == undefined){
      temp = false; 
    }
    else if (input.toString().toLowerCase().search('::') < 0 || input.toString().toLowerCase().search('//') < 0){
      temp = false; 
    }
    else if (isNaN(mm) == true || isNaN(dd) == true || isNaN(yyyy) == true){
      temp = false; 
    } else {
      //temp = mm > 0 && dd > 0 && yyyy > 1969 ? true : false;
      temp = true;    
    }*/

    if (input != null && input != undefined){

      const n = input.toString().match(this.dateRegexDB)?.length;

      if (n != null){
        temp = true;
      }
    }
   // console.log(`isDateTime input: ${input} - Raw Date ${currentDt} - Date: ${date} -  return: ${temp}`);

    return temp;
  }

  isTimeOnly(input: any): boolean{
    var temp = false;

    var currentDt = new Date(input);
    var hh = currentDt.getHours();
    var mm = currentDt.getMinutes();
    var ss = currentDt.getSeconds();
    var time = hh + '/' + mm + '/' + ss;

   // console.log(`isTimeOnly input: ${input} - Time: ${time}`);

    if (input != null && input != undefined){

      const n = input.toString().match(this.dateRegexDB)?.length;

      if (n != null){
        temp = true;
      }
    }

    return temp;
  }

  toBoolean(input:any):any{
    /*
      converts string true or false to their boolean values. 
      if not boolean, return the value input
      does not process null. 
    */
    var temp = input;

    if (input.toLowerCase() == "true") {
      temp = true;
    }
    else if (input.toLowerCase() == "false"){
      temp = false;
    }
    return temp;
  }

  toList(input:string):string[] {
    var temp: string[] = [];


    return temp;
  }


}
