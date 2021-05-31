import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { IndexComponent } from './components/index/index.component';
import { SobrehealthworldComponent } from './components/sobrehealthworld/sobrehealthworld.component';
import { ContactarComponent } from './components/contactar/contactar.component';
import { EsheaderComponent } from './components/esheader/esheader.component';
import { FooterComponent } from './components/footer/footer.component';
import { EsloginComponent } from './components/eslogin/eslogin.component';
import { InindexComponent } from './components/inindex/inindex.component';
import { InheaderComponent } from './components/inheader/inheader.component';
import { AbouthealthworldComponent } from './components/abouthealthworld/abouthealthworld.component';
import { ContactComponent } from './components/contact/contact.component';
import { InloginComponent } from './components/inlogin/inlogin.component';
import { Error404Component } from './components/error404/error404.component';
import { UsuarioPerfilComponent } from './components/usuario-perfil/usuario-perfil.component';
import { UsuarioHeaderComponent } from './components/usuario-header/usuario-header.component';
import { MedicamientosComponent } from './components/admin/medicamientos/medicamientos.component';
import { MedicosComponent } from './components/admin/medicos/medicos.component';
import { AdminhomeComponent } from './components/admin/adminhome/adminhome.component';
import { CrearusuariosComponent } from './components/admin/crearusuarios/crearusuarios.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'index'},
  { path: 'index', component: IndexComponent},
  { path: 'contactar', component: ContactarComponent},
  { path: 'esheader', component: EsheaderComponent},
  { path: 'sobrehealthworld', component: SobrehealthworldComponent},
  { path: 'footer', component: FooterComponent},
  { path: 'eslogin', component: EsloginComponent},
  { path: 'inindex', component: InindexComponent},
  { path: 'inheader', component: InheaderComponent},
  { path: 'abouthealthworld', component: AbouthealthworldComponent},
  { path: 'contact', component: ContactComponent},
  { path: 'inlogin', component: InloginComponent},
  { path: 'usuario-perfil', component: UsuarioPerfilComponent},
  { path: 'usuario-header', component: UsuarioHeaderComponent},
  { path: 'error404', component: Error404Component},
  { path: 'medicamientosComponent', component: MedicamientosComponent},
  { path: 'medicosComponent', component: MedicosComponent},
  { path: 'adminhomeComponent', component: AdminhomeComponent},
  { path: 'crearusuariosComponent', component: CrearusuariosComponent},
  { path: '**', redirectTo: 'error404'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
