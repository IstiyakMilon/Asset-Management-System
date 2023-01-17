import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { JwtClientService } from 'src/app/jwt-client.service';


@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.css']
})
export class LoginPageComponent {

  constructor(private router:Router, private jwtService: JwtClientService){}

  ngOnInit(){
    this.getAccessToken();
  }

  email!:String;
  username!:String;
  password!:String;

  response!:any;
  tokenData: any;

  authRequest:any = {
    'username':'admin',
    'password':'password'
  }

  
  
  public getAccessToken()  {
       let resp = this.jwtService.generateToken(this.authRequest);
       resp.subscribe(
        (token)=>{
          this.tokenData = JSON.parse(token);
          console.log(this.tokenData.jwtToken);          
          this.access(token);          
        }
       );    
  } 

      // Method For getting data ...
    public access(token:any){
      let resp = this.jwtService.welcome(token);
      resp.subscribe(
        (data)=> {
          this.response = data          
          console.log(this.response);          
        }
      )
    }
  

}
