<template>
  <nav class="navigation">
    <ul class="menu">
      <li
        class="menu__item"
        @click="submenu ? menuItemHover = !menuItemHover : ''"
        v-for="{to, name, submenu} in menu">
        <g-link
          :to="to"
          v-if="!submenu"
          class="menu__link"
          exact-active-class="menu__link_active"
          active-class="menu__link_active'">
          {{ name }}
        </g-link>
        <g-link
          v-else
          :to="to"
          event=""
          class="menu__link"
          exact-active-class="menu__link_active"
          :active-class="submenu ? 'menu__link_active' : ''">
          {{ name }}
          <template v-if="submenu">
            <icon-arrow-down/>
          </template>
        </g-link>
        <template v-if="submenu">
          <ul :class="['submenu', {'submenu_visible': menuItemHover}]">
            <li
              v-for="{to, name} in submenu"
              class="submenu__item">
              <g-link
                class="submenu__link"
                :to="to"
              >{{ name }}
              </g-link>
            </li>
          </ul>
        </template>
      </li>
    </ul>
  </nav>
</template>

<script>
import IconArrowDown from './icons/IconArrowDown'

export default {
  name: 'CsdNavigation',
  components: { IconArrowDown },
  data() {
    return {
      menuItemHover: false,
      menu: [
        {
          to: '/',
          name: 'Главная'
        },
        {
          to: '/#about',
          name: 'О компании'
        },
        {
          to: '/services',
          name: 'Услуги',
          clickable: false,
          submenu: [
            {
              to: '/services/1',
              name: 'Испытания косметики'
            },
            {
              to: '/services/2',
              name: 'Испытания детской продукции'
            },
            {
              to: '/services/3',
              name: 'Испытания продукции пищевой промышленности'
            },
            {
              to: '/services/4',
              name: 'Испытания продукции легкой промышленности'
            },
            {
              to: '/services/5',
              name: 'Испытания продукции для регистрационного удостоверения'
            },
            {
              to: '/services/6',
              name: 'Сертификация продукции легкой промышленности'
            },
            {
              to: '/services/7',
              name: 'Сертификация продукции предназначенной для детей и подростков'
            },
            {
              to: '/services/8',
              name: 'Испытания алкогольной продукции'
            },
            {
              to: '/services/9',
              name: 'Испытания игрушек'
            },
            {
              to: '/services/10',
              name: 'Испытания БАДов'
            },
            {
              to: '/services/11',
              name: 'Испытания упаковки'
            }
          ]
        },
        {
          to: '/prices',
          name: 'Цены'
        },
        {
          to: '/#clients',
          name: 'Наши клиенты'
        },
        {
          to: '/contacts',
          name: 'Контакты'
        }
      ]
    }
  }
}
</script>

<style lang="scss">

</style>