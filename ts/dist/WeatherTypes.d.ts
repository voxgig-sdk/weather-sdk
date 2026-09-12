export interface Weather {
    description: string;
    forecast: any[];
    id?: string;
    temperature: string;
    wind: string;
}
export interface WeatherLoadMatch {
    id: string;
}
