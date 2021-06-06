import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-usuario-header',
  templateUrl: './usuario-header.component.html',
  styleUrls: ['./usuario-header.component.css']
})
export class UsuarioHeaderComponent implements OnInit {

  constructor(public translate: TranslateService) {
    this.translate.addLangs(['es', 'en']), this.translate.setDefaultLang('es');
  }

  ngOnInit(): void {
  }

}
