<script setup>
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import Navigation from "@/config/navigation.js";

const route = useRoute();
let navigation = ref();

onMounted(() => {
  navigation.value = new Navigation();
});

function getClasses(item) {
  const currentPageClasses =
    "block py-2 px-3 text-white bg-blue-700 rounded-sm md:bg-transparent md:text-blue-700 md:p-0 dark:text-white md:dark:text-blue-500";
  const classes =
    "block py-2 px-3 text-gray-900 rounded-sm hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent";

  return (item && route.name === item.routerLink.name) ? currentPageClasses : classes;
}

function getAriaCurrent(item) {
  return route.name === item.routerLink.name ? 'page' : null;
}

function toggleNav() {
  document.querySelector('#navigation-menu').classList.toggle('hidden');
}
</script>

<template>
  <header class="h-16">
    <nav class="bg-white dark:bg-gray-900 fixed w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
      <div
        class="flex flex-wrap items-center justify-between mx-auto p-4"
      >
        <RouterLink
          :to="{name: 'index'}"
          class="flex items-center space-x-3"
        >
          <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Pages Vue Test</span>
        </RouterLink>


        <button
          data-collapse-toggle="navigation-menu"
          type="button"
          class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
          aria-controls="navigation-menu"
          aria-expanded="false"
          @click="toggleNav"
        >
          <span class="sr-only">Open main menu</span>
          <svg
            class="w-5 h-5"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 17 14"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M1 1h15M1 7h15M1 13h15"
            />
          </svg>
        </button>

        <div
          id="navigation-menu"
          class="hidden w-full md:block md:w-auto"
        >
          <ul
            v-if="navigation"
            class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"
          >
            <li
              v-for="(item, index) in navigation.items"
              :key="index"
            >
              <RouterLink
                :to="item.routerLink"
                :class="getClasses(item)"
                :aria-current="getAriaCurrent(item)"
              >
                {{ item.text }}
              </RouterLink>
            </li>
            <li>
              <a :class="getClasses(null)">Toggle Light/Dark</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>
