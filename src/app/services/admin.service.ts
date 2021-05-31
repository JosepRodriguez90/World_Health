import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/index';
import { Usuarios } from '../model/usuarios';
import { ApiResponse } from '../model/api-response';
import { environment } from 'src/environments/environment';
import { consultarmedicament } from '../model/consultarmedicament';
import { consultarusuaris } from '../model/consultarusuaris';
import { EliminarUsuario } from '../model/EliminarUsuario';

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  baseUrl ='http://localhost:8080/';

  constructor(private http: HttpClient) {
  }

  adminmedicaments(consultarmedicament): Observable<consultarmedicament> {
    console.log("entre al service llistamedicaments");
    return this.http.post<consultarmedicament>(this.baseUrl + 'llistamedicaments.php', consultarmedicament)
  }

  adminusuaris(consultarusuaris): Observable<consultarusuaris> {
    console.log("entre al service llistamedicaments");
    return this.http.post<consultarusuaris>(this.baseUrl + 'llistausuaris.php', consultarusuaris)
  }

  eliminarUsuario(id_usuario): Observable<EliminarUsuario>{
    console.log(id_usuario);
    return this.http.post<EliminarUsuario>(this.baseUrl + '/eliminarUsuarios.php', id_usuario)

}

}
