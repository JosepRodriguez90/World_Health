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

  login(loginData): Observable<ApiResponse> {
    console.log("entre al service de login");
    return this.http.post<ApiResponse>(this.baseUrl + 'usuarioLogin.php', loginData);
  }

  mostrarPerfil(correo): Observable<any> {
    console.log("entre al service de mostrarPerfil");
    return this.http.post<any>(this.baseUrl + 'usuarioPerfil.php', correo);
  }

}
