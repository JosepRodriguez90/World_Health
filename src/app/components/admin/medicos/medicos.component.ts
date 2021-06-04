import { Component, OnInit } from '@angular/core';
import { ApiResponse } from '../../../model/api-response';
import { environment } from 'src/environments/environment';
import { Router } from '@angular/router';
import { AdminService } from '../../../services/admin.service';
import { consultarusuaris } from '../../../model/consultarusuaris';
import { TranslateService } from '@ngx-translate/core';


@Component({
  selector: 'app-medicos',
  templateUrl: './medicos.component.html',
  styleUrls: ['./medicos.component.css']
})
export class MedicosComponent implements OnInit {
  idusuari: string;
  usuarios;
  usu;

  constructor( public translate: TranslateService,
    private AdminService: AdminService,
    private router: Router,
    ) { this.translate.addLangs(['es', 'en']) }

  ngOnInit(): void {
    this.idusuari = localStorage.getItem('idusuari')
    this.usu = new consultarusuaris(this.idusuari)
    console.log(this.usu)
    this.AdminService.adminusuaris(this.usu)
    .subscribe (
      datos => {
        console.log(datos)
        this.usuarios = Object.values(datos)
        console.log(this.usuarios);
      })
  }

  eliminar(item){

    console.log(item[0])
    this.AdminService.eliminarUsuario(item[0]).subscribe (
      datos => {

        console.log(datos)
        console.log(item[0])
        console.log(item[1])
        console.log(item[2])
        location.reload();
      })

  }

  crear(){
    this.router.navigate(['crearusuariosComponent']);
  }


  modificar(item){
    console.log(item[0]);

    this.AdminService.createUsuarisupdate(item[0]).subscribe(
      (data) => {
        console.log(data);
        console.log(item);
    this.router.navigate(['modificarusuarisComponent',item]);
  });

}

}
