import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-sobrehealthworld',
  templateUrl: './sobrehealthworld.component.html',
  styleUrls: ['./sobrehealthworld.component.css']
})
export class SobrehealthworldComponent implements OnInit {

  constructor(
    private translate: TranslateService
  ) {
    this.translate.addLangs(['es', 'en']);
   }

  ngOnInit(): void {
  }

}
