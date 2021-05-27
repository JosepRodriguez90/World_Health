import { Component, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UsuariosService } from '../../services/usuarios.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-eslogin',
  templateUrl: './eslogin.component.html',
  styleUrls: ['./eslogin.component.css']
})
export class EsloginComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private apiService: UsuariosService
  ) { }


  loginForm: FormGroup;
  invalidLogin: boolean = false;
  submitted: boolean = false;
  validadorsPetits: boolean = false;
  message: any;
  loginData: null;

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      correu: ['', Validators.compose([Validators.required, Validators.min(3), Validators.max(30), Validators.email])],
      contrasenya: ['', Validators.compose([Validators.required, Validators.min(3), Validators.max(20)])]
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

  onSubmit(){
    this.submitted = true;
    console.log(this.loginForm.value);

    if (this.loginForm.invalid) {
      this.invalidLogin = true;
      console.log("Login invalid");

      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Les dades no son correctes.',
      })
      return;
    }

    console.log("login valid!");

    const loginData = {
      correu: this.loginForm.controls.correu.value,
      contrasenya: this.loginForm.controls.contrasenya.value
    };

    this.apiService.login(loginData).subscribe((data: any) => {
      this.message = data.message;
      console.log("entre al php");
    })



  }

  get f(){
    return this.loginForm.controls;
  }

}
