<template>
  <div class="region">
    <div class="region__link">
      <span class="link__text">{{ $static.allAddresses.edges[0].node.name }}</span>
      <div class="dropdown-arrow">
        <icon-arrow-down/>
      </div>
    </div>
    <ul class="region__list">
      <template v-for="(address, index) in $static.allAddresses.edges">
        <li
          :class="['region__item', {'region__link': index===0}]"
        >
          <span class="link__text">{{ address.node.name }}</span>
          <div v-if="index === 0" class="dropdown-arrow">
            <icon-arrow-down/>
          </div>
        </li>
        <li
          class="region__divider"
          v-if="index !== $static.allAddresses.edges.length - 1"
        />
      </template>
    </ul>
  </div>
</template>
<static-query>
query addresses {
  allAddresses {
    edges {
      node {
        id
        name
      }
    }
  }
}
</static-query>
<script>
import IconArrowDown from './icons/IconArrowDown'

export default {
  components: { IconArrowDown }
}
</script>