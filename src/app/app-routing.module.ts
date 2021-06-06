import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { IndexComponent } from './components/index/index.component';
import { SobrehealthworldComponent } from './components/sobrehealthworld/sobrehealthworld.component';
import { ContactarComponent } from './components/contactar/contactar.component';
import { EsheaderComponent } from './components/esheader/esheader.component';
import { FooterComponent } from './components/footer/footer.component';
import { EsloginComponent } from './components/eslogin/eslogin.component';
import { Error404Component } from './components/error404/error404.component';
import { UsuarioPerfilComponent } from './components/usuario-perfil/usuario-perfil.component';
import { UsuarioHeaderComponent } from './components/usuario-header/usuario-header.component';
import { MedicamientosComponent } from './components/admin/medicamientos/medicamientos.component';
import { MedicosComponent } from './components/admin/medicos/medicos.component';
import { AdminhomeComponent } from './components/admin/adminhome/adminhome.component';
import { CrearusuariosComponent } from './components/admin/crearusuarios/crearusuarios.component';
import { CrearmedicaComponent } from './components/admin/crearmedica/crearmedica.component';
import { ModificarmedicaComponent } from './components/admin/modificarmedica/modificarmedica.component';
import { ModificarusuarisComponent } from './components/admin/modificarusuaris/modificarusuaris.component';
import { SoporteComponent } from './components/soporte/soporte.component';
import { InformacioComponent } from './components/informacio/informacio.component';
import { BuscadorComponent } from './components/buscador/buscador.component';
import { InteligenciaComponent } from './components/inteligencia/inteligencia.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'index'},
  { path: 'index', component: IndexComponent},
  { path: 'contactar', component: ContactarComponent},
  { path: 'esheader', component: EsheaderComponent},
  { path: 'sobrehealthworld', component: SobrehealthworldComponent},
  { path: 'footer', component: FooterComponent},
  { path: 'eslogin', component: EsloginComponent},
  { path: 'usuario-perfil', component: UsuarioPerfilComponent},
  { path: 'usuario-header', component: UsuarioHeaderComponent},
  { path: 'error404', component: Error404Component},
  { path: 'medicamientosComponent', component: MedicamientosComponent},
  { path: 'medicosComponent', component: MedicosComponent},
  { path: 'adminhomeComponent', component: AdminhomeComponent},
  { path: 'crearusuariosComponent', component: CrearusuariosComponent},
  { path: 'crearmedicaComponent', component: CrearmedicaComponent},
  { path: 'modificarmedicaComponent', component: ModificarmedicaComponent},
  { path: 'modificarusuarisComponent', component: ModificarusuarisComponent},
  { path: 'soporte', component: SoporteComponent},
  { path: 'informacio', component: InformacioComponent},
  { path: 'buscador', component: BuscadorComponent},
  { path: 'inteligencia', component: InteligenciaComponent},
  { path: '**', redirectTo: 'error404'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
