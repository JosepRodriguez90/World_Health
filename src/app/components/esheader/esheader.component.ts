import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-esheader',
  templateUrl: './esheader.component.html',
  styleUrls: ['./esheader.component.css']
})
export class EsheaderComponent implements OnInit {

  langs: string[] = [];

  constructor(
    private translate: TranslateService
  ) {
    this.translate.addLangs(['es', 'en']);
    this.langs = this.translate.getLangs();
  }

  changeLang(lang: string){
    this.translate.use(lang);
  }

  ngOnInit(): void {
  }

  idioma(){

  }


}
