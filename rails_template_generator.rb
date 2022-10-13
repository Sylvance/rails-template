class RailsTemplateGenerator
  attr_accessor :action_mailbox,
                :action_mailer,
                :action_text,
                :active_record,
                :active_job,
                :active_storage,
                :action_cable,
                :asset_pipeline,
                :javascript,
                :hotwire,
                :jbuilder,
                :minimal,
                :bundle,
                :api,
                :db,
                :name,
                :js,
                :css

  def self.call(
    action_mailbox:,
    action_mailer:,
    action_text:,
    active_record:,
    active_job:,
    active_storage:,
    action_cable:,
    asset_pipeline:,
    javascript:,
    hotwire:,
    jbuilder:,
    minimal:,
    bundle:,
    api:,
    db:,
    name:,
    js:,
    css:
  )
    new(
      action_mailbox,
      action_mailer,
      action_text,
      active_record,
      active_job,
      active_storage,
      action_cable,
      asset_pipeline,
      javascript,
      hotwire,
      jbuilder,
      minimal,
      bundle,
      api,
      db,
      name,
      js,
      css
    ).call
  end

  def initialize(
    action_mailbox,
    action_mailer,
    action_text,
    active_record,
    active_job,
    active_storage,
    action_cable,
    asset_pipeline,
    javascript,
    hotwire,
    jbuilder,
    minimal,
    bundle,
    api,
    db,
    name,
    js,
    css
  )
    @action_mailbox = action_mailbox
    @action_mailer = action_mailer
    @action_text = action_text
    @active_record = active_record
    @active_job = active_job
    @active_storage = active_storage
    @action_cable = action_cable
    @asset_pipeline = asset_pipeline
    @javascript = javascript
    @hotwire = hotwire
    @jbuilder = jbuilder
    @minimal = minimal
    @bundle = bundle
    @api = api
    @db = db
    @name = name
    @js = js
    @css = css
  end

  def call
    run_template(template)
  end

  private

  def run_template(template)
    system(template)
  end

  def template
    "rails new #{name} -T --database=#{db_picked} --javascript=#{js_picked} --css=#{css_picked} #{api_picked} #{action_mailer_picked} #{action_mailbox_picked} #{action_text_picked} #{active_record_picked} #{active_job_picked} #{active_storage_picked} #{action_cable_picked} #{asset_pipeline_picked} #{javascript_picked} #{hotwire_picked} #{jbuilder_picked} #{minimal_picked} #{bundle_picked}"
  end

  def api_picked
    api ?  "--api" : "--no-api"
  end

  def action_mailer_picked
    action_mailer ? "--no-skip-action-mailer" : "--skip-action-mailer"
  end

  def action_mailbox_picked
    action_mailbox ? "--no-skip-action-mailbox" : "--skip-action-mailbox"
  end

  def action_text_picked
    action_text ? "--no-skip-action-text" : "--skip-action-text"
  end

  def active_record_picked
    active_record ? "--no-skip-active-record" : "--skip-active-record"
  end

  def active_job_picked
    active_job ? "--no-skip-active-job" : "--skip-active-job"
  end

  def active_storage_picked
    active_storage ? "--no-skip-active-storage" : "--skip-active-storage"
  end

  def action_cable_picked
    action_cable ? "--no-skip-action-cable" : "--skip-action-cable"
  end

  def asset_pipeline_picked
    asset_pipeline ? "--no-skip-asset-pipeline" : "--skip-asset-pipeline"
  end

  def javascript_picked
    javascript ? "--no-skip-javascript" : "--skip-javascript"
  end

  def hotwire_picked
    hotwire ? "--no-skip-hotwire" : "--skip-hotwire"
  end

  def jbuilder_picked
    jbuilder ? "--no-skip-jbuilder" : "--skip-jbuilder"
  end

  def minimal_picked
    minimal ?  "--minimal" : "--no-minimal"
  end

  def bundle_picked
    bundle ? "--no-skip-bundle" : "--skip-bundle"
  end

  def db_picked
    dbs = {
      mysql: 'mysql',
      postgresql: 'postgresql',
      sqlite3: 'sqlite3',
      oracle: 'oracle',
      sqlserver: 'sqlserver',
      jdbcmysql: 'jdbcmysql',
      jdbcsqlite3: 'jdbcsqlite3',
      jdbcpostgresql: 'jdbcpostgresql',
      jdbc: 'jdbc'
    }

    dbs.fetch(db, "sqlite3")
  end

  def css_picked
    csss = {
      tailwind: "tailwind",
      bootstrap: "bootstrap",
      bulma: "bulma",
      postcss: "postcss",
      sass: "sass"
    }

    csss.fetch(css, "sass")
  end

  def js_picked
    jss = {
      importmap: "importmap",
      webpack: "webpack",
      esbuild: "esbuild",
      rollup: "rollup"
    }

    jss.fetch(js, "importmap")
  end
end

RailsTemplateGenerator.call(
  action_mailbox: true,
  action_mailer: true,
  action_text: true,
  active_record: true,
  active_job: true,
  active_storage: true,
  action_cable: true,
  asset_pipeline: true,
  javascript: true,
  hotwire: true,
  jbuilder: true,
  minimal: true,
  bundle: true,
  api: true,
  db: 'postgresql',
  name: 'Sampler',
  js: 'rollup',
  css: 'bulma'
)
