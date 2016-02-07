$(document).ready(function() {
  if ($('body').data('page') == 'tallies-home') {
    // component
    Vue.component('tallytable', {
      template: '#tally-template',
      props: ['tally']
    })

    // filter
    Vue.filter('fix2', function(value) {
      return (+value).toFixed(2);
    })

    // vue instance
    var tallyVue = new Vue({
      el: 'body',
      data: {
        getTallyDataUrl: '/tallies/tally_data',
        pickedFlag: '',
        tallyData: {},
        incomeTypes: [],
        tallyTypes: []
      },
      ready: function() {
        var self = this;
        $.getJSON(self.getTallyDataUrl, function(response) {
          self.tallyData = response.tally_data;
          self.incomeTypes = response.income_types;
          self.tallyTypes = response.tally_types;
        });
      },
      methods: {
        deleteIncomeType: function(type) {
          var self = this;
          $.post('/income_types/' + type.id, { _method: 'delete' }, function(response) {
            if (response.msg == 'success') {
              self.incomeTypes.splice(self.incomeTypes.indexOf(type), 1);
            }
          });
        },
        deleteTallyType: function(type) {
          var self = this;
          $.post('/tally_types/' + type.id, { _method: 'delete' }, function(response) {
            if (response.msg == 'success') {
              self.tallyTypes.splice(self.tallyTypes.indexOf(type), 1);
            }
          });
        }
      }
    })
    // vue instance end

    $('#new_income_type').on('ajax:success', function(e, data, status, xhr) {
      tallyVue.incomeTypes.push(data);
    });
    $('#new_tally_type').on('ajax:success', function(e, data, status, xhr) {
      tallyVue.tallyTypes.push(data);
    });

  }
})


