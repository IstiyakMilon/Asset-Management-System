import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { LoginPageComponent } from './components/login-page/login-page.component';

const routes: Routes = [
  {path: 'login', component:LoginPageComponent},
  {path:'dashboard', component:DashboardComponent, pathMatch:"full"},
  {path: '', component:LoginPageComponent,},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
