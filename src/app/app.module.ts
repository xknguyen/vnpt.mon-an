import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
//import * as $ from 'jquery';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { ListItemPage } from '../pages/list-item/list-item';
import { RestaurantPage } from '../pages/restaurant/restaurant';
import { CategoriesPage } from '../pages/categories/categories';
import { ListSeclectedPage } from '../pages/list-seclected/list-seclected';
import { LoginPage } from '../pages/login/login';

import { HttpClientModule } from '@angular/common/http';
import { ProductServiceProvider } from '../providers/product-service/product-service';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { CallNumber } from '@ionic-native/call-number';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    ListItemPage,
    RestaurantPage,
    CategoriesPage,
    ListSeclectedPage,
    LoginPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    HttpClientModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    ListItemPage,
    RestaurantPage,
    CategoriesPage,
    ListSeclectedPage,
    LoginPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    ProductServiceProvider,
    CallNumber
  ]
})
export class AppModule {}
