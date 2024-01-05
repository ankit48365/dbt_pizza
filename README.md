<h2>The Pizza Datawarehouse </h2>
<p>Tech Stack used in this Project</p>
<div style="text-align: center;">
  <table>
    <tr>
      <td align="center"><img src="./logo/microsoft-sql-server-log.png" width="50"/></td>
      <td align="center"><img src="./logo/airbyte-logo.png" width="50"/></td>
      <td align="center"><img src="./logo/airflow-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/dbt-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/postgresql-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/github-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/vscode-svgrepo-com.png" width="50"/></td>
    </tr>
  </table>
</div>

<h3>Description:</h3>
<p>This is a farely simple project where we run a daily batch to read source data for a pizza store (SQL Server), We use Airbyte to Extract and Load data to Staging layer, Further we use DBT to clean, massage and Transform the data in the middle layer. We use DBT again to load Fact and Dimension tables to be used in BI Stage. PostgreSQL is the Data Platform used in this project. Apache Airflow is used for Data Orchestration. (Future enhancement is integration of Apache Superset for Data Visualization) </p>