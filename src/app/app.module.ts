import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HttpClient  } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IndexComponent } from './components/index/index.component';
import { SobrehealthworldComponent } from './components/sobrehealthworld/sobrehealthworld.component';
import { ContactarComponent } from './components/contactar/contactar.component';
import { EsheaderComponent } from './components/esheader/esheader.component';
import { FooterComponent } from './components/footer/footer.component';
import { EsloginComponent } from './components/eslogin/eslogin.component';
import { UsuariosService } from './services/usuarios.service';
import { AdminService } from './services/admin.service';
import { Error404Component } from './components/error404/error404.component';
import { UsuarioPerfilComponent } from './components/usuario-perfil/usuario-perfil.component';
import { UsuarioHeaderComponent } from './components/usuario-header/usuario-header.component';
import { AdminheaderComponent } from './components/admin/adminheader/adminheader.component';
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
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { IdiomaComponent } from './components/idioma/idioma.component';

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/traductor/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
    IndexComponent,
    SobrehealthworldComponent,
    ContactarComponent,
    EsheaderComponent,
    FooterComponent,
    EsloginComponent,
    Error404Component,
    UsuarioPerfilComponent,
    UsuarioHeaderComponent,
    AdminheaderComponent,
    MedicamientosComponent,
    MedicosComponent,
    AdminhomeComponent,
    CrearusuariosComponent,
    CrearmedicaComponent,
    ModificarmedicaComponent,
    ModificarusuarisComponent,
    SoporteComponent,
    InformacioComponent,
    BuscadorComponent,
    InteligenciaComponent,
    IdiomaComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    })
  ],
  providers: [
    UsuariosService,
    AdminService],
  bootstrap: [AppComponent]
})
export class AppModule { }
