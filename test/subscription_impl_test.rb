require_relative 'test_helper'

# SubscriptionTest.
# @class_description
#   Tests the Subscription class.
class SubscriptionTest < Minitest::Test

  # Constants.
  CLASS       = Subscription
  ONE         = 1
  TEST_SYMBOL = :test_symbol
  NILCLASS_I  = nil
  TEST_FLOAT  = 3.14

  # test_conf_doc_f_ex().
  # @description
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, README.md,
  #   .yardopts, .gitignore, Changelog.md, CODE_OF_CONDUCT.md,
  #   subscription_impl.gemspec, Gemfile.lock, and Rakefile files exist.
  def test_conf_doc_f_ex()

    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')
    assert_path_exists('.yardopts')
    assert_path_exists('.gitignore')
    assert_path_exists('Changelog.md')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('subscription_impl.gemspec')
    assert_path_exists('Gemfile.lock')
    assert_path_exists('Rakefile')

  end

  # test_version_declared().
  # @description
  #   The version was declared.
  def test_version_declared()
    refute_nil(Subscription::VERSION)
  end

  # setup().
  # @description
  #   Set fixtures.
  def setup()
  end

  # Subscription.subscribable().

  # test_sc_x().
  # @description
  #   SUBSCRIBABLE is a size one Set containing Node.
  def test_sc_x()

    s_set = Subscription.subscribable()
    assert_same(s_set.size(), ONE)
    assert_operator(s_set, 'include?', NodeDiagram)

  end

  # Subscription.publishable().

  # test_sp_x1().
  # @description
  #   PUBLISHABLE is a Set containing Node.
  def test_sp_x1()

    p = Subscription.publishable()
    assert_same(ONE, p.size())
    assert_includes(p, Node)

  end

  # Subscription.publisher(published = nil).

  # test_cpub_x1().
  # @description
  #   A publisher class instance argument.
  def test_cpub_x1()
    n = Node.new(nil, :test_symbol, nil)
    assert_operator(Subscription, 'publisher', n)
  end

  # test_cpub_x2().
  # @description
  #   Any object excluding subscribable objects.
  def test_cpub_x2()
    refute_operator(Subscription, 'publisher', TEST_SYMBOL)
  end

  # Subscription.s_instance(subscriber = nil).

  # test_si_x1().
  # @description
  #   A subscribable argument.
  def test_si_x1()

    nd = Minitest::Mock.new()
    nd.expect(:class, NodeDiagram)
    assert_operator(Subscription, 's_instance', nd)

  end

  # test_si_x2().
  # @description
  #   Any argument excluding a subscribable argument.
  def test_si_x2()
    refute_operator(Subscription, 's_instance', TEST_SYMBOL)
  end

  # Subscription.kind_subscription(subject = nil).

  # test_ks_x1().
  # @description
  #   A call using the default parameter.
  def test_ks_x1()
    assert_raises(NameError) { Subscription.kind_subscription() }
  end

  # Subscription.new().

  # test_sn_x1().
  # @description
  #   Calling new outside the class.
  def test_sn_x1()
    assert_raises(NameError) { Subscription.new() }
  end

  # teardown().
  # @description
  #   Cleanup.
  def teardown()
  end

end
