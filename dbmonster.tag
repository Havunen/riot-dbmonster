<dbmonster>
  <table class="table table-striped latest-data">
    <tbody>
      <tr each={ dbs } no-reorder>

        <td class="dbname">
          { dbname }
        </td>

        <td class="query-count">
          <span class="{ lastSample.countClassName }">
            { lastSample.nbQueries }
          </span>
        </td>

        <td each={ lastSample.topFiveQueries } no-reorder class="{ elapsedClassName }">
          <span>{ formatElapsed }</span>
          <div class="popover left">
            <div class="popover-content">{ query }</div>
            <div class="arrow"></div>
          </div>
        </td>

      </tr>
    </tbody>
  </table>

  this.dbs = opts.dbs;
  var that = this;

  function redraw() {
    that.dbs = ENV.generateData(false).toArray();
    Monitoring.renderRate.ping();

    that.update();
    setTimeout(redraw, ENV.timeout);
  }
  redraw();

</dbmonster>
