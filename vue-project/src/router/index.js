import { createRouter, createWebHistory } from 'vue-router';
import MainPage from '@/components/MainPage.vue';
import CarsPage from '@/components/CarsPage.vue';
import BrandsPage from '@/components/BrandsPage.vue';
import CarCreationForm from '@/components/CarCreationForm.vue';
import BrandCreationForm from '@/components/BrandCreationForm.vue';

const routes = [
  { path: '/', component: MainPage },
  { path: '/cars', component: CarsPage },
  { path: '/brands', component: BrandsPage },
  { path: '/cars/create', component: CarCreationForm },
  { path: '/brands/create', component: BrandCreationForm }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
