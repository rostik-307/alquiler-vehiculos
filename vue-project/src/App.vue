<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <div id="app">
    <!-- Top Navigation -->
    <nav class="navbar">
      <router-link to="/" class="main-logo-link">
        <img src="/src/assets/logo.svg" alt="car-logo" class="main-logo" />
      </router-link>
      <router-link to="/" class="nav-link">Inicio</router-link>
      <router-link to="/cars" class="nav-link">Coches</router-link>
      <router-link to="/brands" class="nav-link">Marcas</router-link>
    </nav>

    <div class="content">
      <router-view />
    </div>
  </div>
</template>

<style scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: #000;
  font-weight: bold;
}

nav a.router-link-exact-active:hover {
  background-color: #888;
  color: var(--text-color);
}

nav a {
  display: inline-block;
  padding: 0 1rem;
}

nav a:first-of-type {
  border: 0;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  nav {
    text-align: left;
    margin-left: -1rem;
    font-size: 1rem;

    padding: 1rem 0;
    margin-top: 1rem;
  }
}
</style>
