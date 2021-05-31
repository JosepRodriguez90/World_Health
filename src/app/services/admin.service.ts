import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/index';
import { Usuarios } from '../model/usuarios';
import { ApiResponse } from '../model/api-response';
import { environment } from 'src/environments/environment';
import { consultarmedicament } from '../model/consultarmedicament';
import { consultarusuaris } from '../model/consultarusuaris';
import { EliminarUsuario } from '../model/EliminarUsuario';
import { EliminarMedicamiento} from '../model/EliminarMedicamiento';
import { User} from '../model/User';

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

  eliminarMedicamiento(id_medicamiento): Observable<EliminarMedicamiento>{
    console.log(id_medicamiento);
    return this.http.post<EliminarMedicamiento>(this.baseUrl + '/eliminarMedicamiento.php', id_medicamiento)

}

  createUser(user: User): Observable<ApiResponse> {
    console.log(user);
    return this.http.post<ApiResponse>(this.baseUrl + '/insertUsuario.php', user);
  }

}
