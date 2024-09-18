import { PluginListenerHandle,Plugin } from "@capacitor/core";
export declare type GpsIsEnabled = true;
export interface testPermissionIosPlugin extends Plugin{
  echo(options: { value: string }): Promise<{ value: string }>;
  isGpsEnabled(): Promise<GpsIsEnabled>;
  showEnableLocationAlert(options: { value: string }):Promise<void>
  // addListener(eventName: 'tapEvent' | 'cancelAction' | 'locationStatusChange', callback: (info: any) => void): Promise<PluginListenerHandle>;
  requestPermissions(): Promise<void>;
  addListener(eventName: 'cancelAction' | 'locationStatusChange', listenerFunc: (info: any) => any): Promise<PluginListenerHandle>;
  // addListener(eventName: 'tapEvent' | 'cancelAction' | 'locationStatusChange',callback: (info: any) => void): Promise<PluginListenerHandle>;
}
