import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/Home.vue'

const routes = [

  {
    path: '/',
    name: 'home',
    component: HomeView
  },

  {
    path: '/customer',
    name: 'customer',
    component: () => import('../views/Customer.vue')
  },

  {
    path: '/contact',
    name: 'contact',
    component: () => import('../views/Contact.vue')
  },

  {
    path: '/type',
    name: 'type',
    component: () => import('../views/Type.vue')
  },

  {
    path: '/employee',
    name: 'employee',
    component: () => import('../views/Employee.vue')
  },

  {
    path: '/add_customer',
    name: 'add_customer',
    component: () => import('../views/Add_customer.vue'),
    meta: { requiresAuth: true }
  },

  {
    path: '/add_employee',
    name: 'add_employee',
    component: () => import('../views/Add_employee.vue'),
    meta: { requiresAuth: true }
  },

  {
    path: '/product',
    name: 'product',
    component: () => import('../views/Product.vue')
  },

  {
    path: '/product_api',
    name: 'product_api',
    component: () => import('../views/Product_api.vue')
  },

  {
    path: '/show_product',
    name: 'show_product',
    component: () => import('../views/Show_product.vue')
  },

  {
    path: '/customer_crud',
    name: 'customer_crud',
    component: () => import('../views/Customer_crud.vue'),
    meta: { requiresAuth: true }
  },

  {
    path: '/employee_crud',
    name: 'employee_crud',
    component: () => import('../views/Employee_crud.vue'),
    meta: { requiresAuth: true }
  },

  {
    path: '/employee_crud_image',
    name: 'employee_crud_image',
    component: () => import('../views/Employee_crud_image.vue'),
    meta: { requiresAuth: true }
  },

  {
    path: '/product_crud',
    name: 'product_crud',
    component: () => import('../views/Product_crud.vue'),
    meta: { requiresAuth: true }
  },

  {
    path: '/login',
    name: 'login',
    component: () => import('../views/login.vue')
  },

  /* ✅ Product Detail */

  {
    path: '/ProductDetail',
    name: 'ProductDetail',
    component: () => import('../views/ProductDetail.vue')
  }

]

const router = createRouter({
  history: createWebHistory(),
  routes
})

/* ✅ ROUTE GUARD */
router.beforeEach((to, from, next) => {

  const isLoggedIn = localStorage.getItem("adminLogin")

  if (to.meta.requiresAuth && !isLoggedIn) {
    next('/login')
  } 
  else if (to.path === '/login' && isLoggedIn) {
    next('/')
  }
  else {
    next()
  }
})

export default router
