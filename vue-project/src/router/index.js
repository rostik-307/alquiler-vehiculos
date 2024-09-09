import { createRouter, createWebHistory } from 'vue-router';
import CarsPage from '@/components/CarsPage.vue';
import BrandsPage from '@/components/BrandsPage.vue';

const routes = [
  { path: '/cars', component: CarsPage },
  { path: '/brands', component: BrandsPage },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
