import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IndexComponent } from './components/index/index.component';
import { SobrehealthworldComponent } from './components/sobrehealthworld/sobrehealthworld.component';
import { ContactarComponent } from './components/contactar/contactar.component';
import { EsheaderComponent } from './components/esheader/esheader.component';
import { FooterComponent } from './components/footer/footer.component';
import { EsloginComponent } from './components/eslogin/eslogin.component';
import { InindexComponent } from './components/inindex/inindex.component';
import { AbouthealthworldComponent } from './components/abouthealthworld/abouthealthworld.component';
import { ContactComponent } from './components/contact/contact.component';
import { InheaderComponent } from './components/inheader/inheader.component';
import { InloginComponent } from './components/inlogin/inlogin.component';

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

@NgModule({
  declarations: [
    AppComponent,
    IndexComponent,
    SobrehealthworldComponent,
    ContactarComponent,
    EsheaderComponent,
    FooterComponent,
    EsloginComponent,
    InindexComponent,
    AbouthealthworldComponent,
    ContactComponent,
    InheaderComponent,
    InloginComponent,
    Error404Component,
    UsuarioPerfilComponent,
    UsuarioHeaderComponent,
    AdminheaderComponent,
    MedicamientosComponent,
    MedicosComponent,
    AdminhomeComponent,
    CrearusuariosComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
  ],
  providers: [
    UsuariosService,
    AdminService],
  bootstrap: [AppComponent]
})
export class AppModule { }
