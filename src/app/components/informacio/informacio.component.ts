import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-informacio',
  templateUrl: './informacio.component.html',
  styleUrls: ['./informacio.component.css']
})
export class InformacioComponent implements OnInit {

  constructor(
    public translate: TranslateService
  ) { this.translate.addLangs(['es', 'en']), this.translate.setDefaultLang('es'); }

  ngOnInit(): void {
  }

}
