import { HttpClient, HttpEvent, HttpHandler, HttpHeaders, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class JwtClientService{

  constructor(private http:HttpClient) { }

  apiAddress:string = 'http://localhost:8083';

  public generateToken(request: any){
    
    return this.http.post<any>(`${this.apiAddress}/authenticate`, request, {responseType: 'text' as 'json'});
  }

  public welcome(token: any){      
     let t = 'Bearer  '+JSON.parse(token).jwtToken;           
     const headers = {"Authorization":t};
    // console.log(t);
    
    return this.http.get<any>('http://localhost:8083/getData', {headers});
  }

}
