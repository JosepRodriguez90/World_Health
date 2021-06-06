import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/index';
import { Usuarios } from '../model/usuarios';
import { ApiResponse } from '../model/api-response';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  // Aqui ficar el port del usbwebserver i que aquest tingui coma raiz la carpeta php
  baseUrl ='http://localhost:8080/';

  constructor(private http: HttpClient) { }

  login(loginData): Observable<any> {
    console.log("entre al service de login");
    return this.http.post(this.baseUrl + 'usuarioLogin.php', JSON.stringify(loginData));
  }

  mostrarPerfil(correo): Observable<any> {
    console.log("entre al service de mostrarPerfil");
    return this.http.post(this.baseUrl + 'usuarioPerfil.php', JSON.stringify(correo));
  }

  buscarIdMedicamentos(query): Observable<any> {
    console.log("entre al service de buscar medicamentos");
    return this.http.post(this.baseUrl + 'buscarIdMedicamento.php', JSON.stringify(query));
  }





}
