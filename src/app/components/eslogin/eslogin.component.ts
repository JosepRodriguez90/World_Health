import { Component, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UsuariosService } from '../../services/usuarios.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { ApiResponse } from '../../model/api-response';
import { environment } from 'src/environments/environment';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-eslogin',
  templateUrl: './eslogin.component.html',
  styleUrls: ['./eslogin.component.css']
})
export class EsloginComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private apiService: UsuariosService,
    public translate: TranslateService
  ) {    this.translate.addLangs(['es', 'en']);  }


  loginForm: FormGroup;
  invalidLogin: boolean = false;
  submitted: boolean = false;
  validadorsPetits: boolean = false;
  contrasenyaNoCoincideix: boolean = false;
  usuariNoExisteix: boolean = false;
  missatgeData: any;
  correuData: any;
  loginData: null;

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      correu: ['', Validators.compose([Validators.required, Validators.minLength(3), Validators.maxLength(30), Validators.email])],
      contrasenya: ['', Validators.compose([Validators.required, Validators.minLength(3), Validators.maxLength(20)])]
    });

    this.validadorsPetits = true;
  }

  mostrarContrasenya(){
    let tipo :any = document.getElementById("contrasenya");
    if(tipo.type == "password"){
        tipo.type = "text";
    }else{
        tipo.type = "password";
    }
  }

  get f(){
    return this.loginForm.controls;
  }

  onSubmit(){
    this.submitted = true;
    console.log(this.loginForm.value);

    if (this.loginForm.invalid) {
      this.invalidLogin = true;
      console.log("Login invalido");

      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Los datos no son correctos.',
      })
      return;
    }

    console.log("login valid!");

    const loginData = {
      correu: this.loginForm.controls.correu.value,
      contrasenya: this.loginForm.controls.contrasenya.value
    };

    this.apiService.login(loginData).subscribe((data: any) => {
      this.missatgeData = data.missatge;

      console.log("entre al php");
      console.log(this.missatgeData)

      if(this.missatgeData == "Login Correcto"){
        environment.correu = data.correu;
        if(environment.correu=='admin@admin.com'){
          this.router.navigate(['adminhomeComponent']);
        }else{
          this.router.navigate(['usuario-perfil']);
        }

      }
      else if(this.missatgeData == "Contraseña Incorrecta"){
        this.contrasenyaNoCoincideix = true;
        this.invalidLogin = true;
        console.log("Contrasenya invalida");

        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: 'La contraseña no coincide.',
        })
        return;
      }
      else{
        this.usuariNoExisteix = true;
        this.invalidLogin = true;
        console.log("El usuari no existeix");

        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: 'El usuario no existe.',
        })
        return;
      }
    })
  }

}
