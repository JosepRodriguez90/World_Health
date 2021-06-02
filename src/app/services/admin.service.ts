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
import { Medica} from '../model/Medica';
import { updateMedica} from '../model/updateMedica';
import { updateUsuaris} from '../model/updateUsuaris';


@Injectable({
  providedIn: 'root'
})
export class AdminService {

  loggedUser: Medica = null;
  baseUrl ='http://localhost:8080/';

  constructor(private http: HttpClient) {
  }

  adminmedicaments(consultarmedicament): Observable<consultarmedicament> {
    console.log("entre al service llista medicaments");
    return this.http.post<consultarmedicament>(this.baseUrl + 'llistamedicaments.php', consultarmedicament)
  }

  adminusuaris(consultarusuaris): Observable<consultarusuaris> {
    console.log("entre al service llista usuaris");
    return this.http.post<consultarusuaris>(this.baseUrl + 'llistausuaris.php', consultarusuaris)
  }

  eliminarUsuario(id_usuario): Observable<EliminarUsuario>{
    console.log(id_usuario);
    return this.http.post<EliminarUsuario>(this.baseUrl + 'eliminarUsuarios.php', id_usuario)

  }

  eliminarMedicamiento(id_medicamiento): Observable<EliminarMedicamiento>{
    console.log(id_medicamiento);
    return this.http.post<EliminarMedicamiento>(this.baseUrl + 'eliminarMedicamiento.php', id_medicamiento)

  }

  createUser(user: User): Observable<ApiResponse> {
    console.log(user);
    return this.http.post<ApiResponse>(this.baseUrl + '/insertUsuario.php', user);
  }


  createMedica(medica: Medica): Observable<ApiResponse> {
    console.log(medica);
    return this.http.post<ApiResponse>(this.baseUrl + 'insertMedica.php', medica);
  }

  updateMedica(upmedica: Medica) {
    return this.http.post<ApiResponse>(this.baseUrl + '/updateMedica.php', upmedica);
  }

  createMedicaupdate(upmedicaint: updateMedica): Observable<ApiResponse> {
    console.log(upmedicaint);
    return this.http.post<ApiResponse>(this.baseUrl + 'insertMedicaupdate.php', upmedicaint);
  }

  createUsuarisupdate(upusuarisint: updateUsuaris): Observable<ApiResponse> {
    console.log(upusuarisint);
    return this.http.post<ApiResponse>(this.baseUrl + 'insertUsuarisupdate.php', upusuarisint);
  }

  updateUsuaris(upusuaris: User) {
    console.log(upusuaris);
    return this.http.post<ApiResponse>(this.baseUrl + '/updateUsuaris.php', upusuaris);
  }


  idmostrarusuaris(idconsultarusuaris): Observable<consultarusuaris> {
    console.log("entre al service llista usuaris");
    return this.http.post<consultarusuaris>(this.baseUrl + 'idconsultarusuari.php', idconsultarusuaris)
  }


  idmostrarmedica(idconsultarmedica): Observable<consultarmedicament> {
    console.log("entre al service llista medicaments");
    return this.http.post<consultarmedicament>(this.baseUrl + 'idconsultarmedica.php', idconsultarmedica)
  }

}
