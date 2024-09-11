import { createRouter, createWebHistory } from 'vue-router';
import MainPage from '@/components/MainPage.vue';
import CarsPage from '@/components/DataTables/CarsPage.vue';
import BrandsPage from '@/components/DataTables/BrandsPage.vue';
import CarCreationForm from '@/components/CreationForms/CarCreationForm.vue';
import BrandCreationForm from '@/components/CreationForms/BrandCreationForm.vue';
import CarDetails from '@/components/Details/CarDetails.vue';
import CarEditForm from '@/components/EditForm/CarEditForm.vue';
import BrandDetailsPage from '@/components/Details/BrandDetails.vue';
import BrandEditForm from '@/components/EditForm/BrandEditForm.vue';

const routes = [
  { path: '/', component: MainPage },
  { path: '/cars', component: CarsPage },
  { path: '/brands', component: BrandsPage },
  { path: '/cars/create', component: CarCreationForm },
  { path: '/brands/create', component: BrandCreationForm },
  { path: '/cars/:id', component: CarDetails, props: true },  // Route for car details
  { path: '/cars/edit/:id', component: CarEditForm, props: true },  // Route for car editing
  { path: '/brands/:id', component: BrandDetailsPage },  // To view details
  { path: '/brands/edit/:id', component: BrandEditForm },  // To edit brand

];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;