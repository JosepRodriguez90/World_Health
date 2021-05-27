import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { IndexComponent } from './components/index/index.component';
import { SobrehealthworldComponent } from './components/sobrehealthworld/sobrehealthworld.component';
import { ContactarComponent } from './components/contactar/contactar.component';
import { EsheaderComponent } from './components/esheader/esheader.component';
import { FooterComponent } from './components/footer/footer.component';
import { EsloginComponent } from './components/eslogin/eslogin.component';

const routes: Routes = [{path: '', pathMatch: 'full', redirectTo: 'index'},
{ path: 'index', component: IndexComponent},
{ path: 'contactar', component: ContactarComponent},
{ path: 'esheader', component: EsheaderComponent},
{ path: 'sobrehealthworld', component: SobrehealthworldComponent},
{ path: 'footer', component: FooterComponent},
{ path: 'eslogin', component: EsloginComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
