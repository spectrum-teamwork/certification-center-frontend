<template>
  <div class="region" :key="currentRegionId">
    <div class="region__link">
      <span hidden v-if="currentRegionId === undefined && setDefaultRegion($static.allAddresses)"></span>
      <template v-for="({node}, index) in $static.allAddresses.edges">
        <span
          v-if="currentRegionId !== undefined && node.id === currentRegionId"
          class="link__text">
          {{ $static.allAddresses.edges[index].node.region }}
        </span>
        <span
          v-else-if="currentRegionId === undefined && index === defaultRegionIndex"
          class="link__text">
          {{ $static.allAddresses.edges[defaultRegionIndex].node.region }}
        </span>
      </template>
      <div class="dropdown-arrow">
        <icon-arrow-down/>
      </div>
    </div>
    <ul class="region__list">
      <template v-for="({node}, index) in $static.allAddresses.edges">
        <li
          v-if="regionIsActive(node.id, index)"
          @click="setRegion(node.id)"
          :class="['region__item', 'region__link']"
        >
          <span class="link__text">{{ node.region }}</span>
          <div class="dropdown-arrow">
            <icon-arrow-down/>
          </div>
        </li>
        <li
          class="region__divider"
          v-if="regionIsActive(node.id, index)"
        />
      </template>
      <template v-for="({node}, index) in $static.allAddresses.edges">
        <li
          v-if="!regionIsActive(node.id, index)"
          @click="setRegion(node.id)"
          :class="['region__item']"
        >
          <span class="link__text">{{ node.region }}</span>
        </li>
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
        region
      }
    }
  }
}
</static-query>
<script>
import Cookies from 'js-cookie'
import IconArrowDown from './icons/IconArrowDown'

export default {
  components: { IconArrowDown },
  data() {
    return {
      currentRegionId: null,
      defaultRegionIndex: 0
    }
  },
  methods: {
    setDefaultRegion(regions) {
      this.setRegion(regions.edges[this.defaultRegionIndex].node.id)
      return false
    },
    setRegion(regionId) {
      Cookies.set('_region', regionId)
      this.currentRegionId = regionId
    },
    regionIsActive(regionId, index) {
      if (this.currentRegionId !== undefined) {
        return this.currentRegionId === regionId
      } else if (this.currentRegionId === undefined && index === this.defaultRegionIndex) {
        return true
      }
    }
  },
  watch: {
    currentRegionId: {
      handler(regionId) {
        dispatchEvent(new CustomEvent('onregionupdate', {
          detail: { regionId }
        }))
      }
    }
  },
  beforeMount() {
    this.currentRegionId = Cookies.get('_region')
  }
}
</script>