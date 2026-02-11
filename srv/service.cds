using {S4HANA_KNA1 as customer} from '../srv/external/S4HANA_KNA1';

service PropagationService {
    entity Customer as projection on customer.zjwtest_kna1;
}
