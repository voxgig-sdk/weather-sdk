import { WeatherEntityBase } from '../WeatherEntityBase';
import type { WeatherSDK } from '../WeatherSDK';
import type { Control } from '../types';
import type { Weather, WeatherLoadMatch } from '../WeatherTypes';
declare class WeatherEntity extends WeatherEntityBase<Weather> {
    constructor(client: WeatherSDK, entopts: any);
    make(this: WeatherEntity): WeatherEntity;
    load(this: any, reqmatch?: WeatherLoadMatch, ctrl?: Control): Promise<WeatherEntity>;
}
export { WeatherEntity };
