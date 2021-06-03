import { Component, OnInit } from '@angular/core';
import { UsuariosService } from '../../services/usuarios.service';
import { ApiResponse } from '../../model/api-response';
import { Router } from '@angular/router';
import { Usuarios } from '../../model/usuarios';
import { environment } from 'src/environments/environment';
import { AdminService } from '../../services/admin.service';
import { updateUsuaris } from 'src/app/model/updateUsuaris';

@Component({
  selector: 'app-usuario-perfil',
  templateUrl: './usuario-perfil.component.html',
  styleUrls: ['./usuario-perfil.component.css']
})
export class UsuarioPerfilComponent implements OnInit {
  correo: string;
  usuario: Usuarios;

  constructor(
    private apiService: UsuariosService,
    private AdminService: AdminService,
    private router : Router
  ) { }

  ngOnInit(): void {
    this.usuario = new Usuarios();
    this.correo = environment.correu;

    console.log(this.correo);

    this.apiService.mostrarPerfil(this.correo).subscribe((data: Usuarios[]) => {
      console.log("entre al php");
      console.log(data);
      this.usuario.nom = data["nom"];
      this.usuario.cognom = data["cognom"];
      this.usuario.telefon = data["telefon"];
      this.usuario.email = data["email"];
      this.usuario.dni = data["dni"];
      this.usuario.num_colegiat = data["num_colegiat"];
      this.usuario.altres = data["altres"];
      console.log("el nom del usuario loguejat es: "+this.usuario.nom);
      console.log("el cognom del usuario loguejat es: "+this.usuario.cognom);
      console.log("el email del usuario loguejat es: "+this.usuario.email);
    })
  }

}
